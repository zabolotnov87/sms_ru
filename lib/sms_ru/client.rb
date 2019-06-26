require_relative 'client/models'
require_relative 'client/api'
require_relative 'client/middlewares/handle_connection_error'
require_relative 'client/middlewares/handle_http_error'

module SmsRu
  class Client
    include Api
    include Configurable

    def initialize(options = {})
      CONFIGURATION_OPTIONS.each do |attribute|
        value = options[attribute] || SmsRu.send(attribute)
        send("#{attribute}=", value)
      end
      connection
    end

    private

    def connection
      @connection ||= Faraday.new(url: api_endpoint) do |connection|
        setup_timeouts!(connection)
        setup_auth!(connection)
        setup_error_handling!(connection)
        setup_log_filters!(connection)
        setup_json!(connection)

        connection.adapter(Faraday.default_adapter)
      end
    end

    def setup_timeouts!(connection)
      connection.options.open_timeout = open_timeout
      connection.options.timeout = read_timeout
    end

    def setup_auth!(connection)
      connection.params[:api_id] = api_id
    end

    def setup_error_handling!(connection)
      connection.use(:sms_ru_handle_connection_error)
      connection.response(:sms_ru_handle_http_error)
    end

    def setup_log_filters!(connection)
      connection.response(:logger, logger) do |logger|
        logger.filter(/(api_id=)([^&]+)/, '\1[FILTERED]')
      end
    end

    def setup_json!(connection)
      connection.params[:json] = 1
    end

    def http_post(resource, params:, headers: {})
      connection.post do |request|
        request.url(resource)
        request.headers.merge!(headers)
        request.params.merge!(params)
      end
    end

    def http_get(resource, params = {})
      connection.get do |request|
        request.url(resource)
        request.params.update(params) unless params.empty?
      end
    end
  end
end
