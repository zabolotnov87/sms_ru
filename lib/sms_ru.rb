require 'faraday'
require 'json'
require 'hashie'

require_relative 'sms_ru/errors'
require_relative 'sms_ru/configurable'
require_relative 'sms_ru/client'
require_relative 'sms_ru/version'

module SmsRu
  class << self
    include Configurable

    def client
      return @client if defined?(@client) && @client.same_options?(options)

      @client = Client.new(options)
    end
  end
end
