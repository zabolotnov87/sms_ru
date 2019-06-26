module SmsRu
  class Client
    module Api
      module Sms
        SEND_PATH = 'sms/send'.freeze

        # @param request [SmsRu::Requests::SendSms, Hash]
        # @raise [SmsRu::Responses::SendSms::Error]
        # @return [SmsRu::Responses::SendSms]
        #
        def send_sms(request)
          request = Requests::SendSms.new(request) unless request.is_a?(Requests::SendSms)
          response = http_post(SEND_PATH, params: request)
          json = JSON.parse(response.body)
          result = Responses::SendSms.new(json)
          return result if result.success?

          raise result.to_error
        end
      end

      include Sms
    end
  end
end
