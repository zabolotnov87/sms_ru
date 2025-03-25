module SmsRu
  class Client
    module Api
      module Sms
        SEND_SMS_PATH = 'sms/send'.freeze
        CODE_CALL_PATH = 'code/call'.freeze

        # @param request [SmsRu::Requests::SendSms, Hash]
        # @raise [SmsRu::Responses::SendSms::Error]
        # @return [SmsRu::Responses::SendSms]
        #
        def send_sms(request)
          request = Requests::SendSms.new(request) unless request.is_a?(Requests::SendSms)
          response = http_post(SEND_SMS_PATH, params: request)
          json = JSON.parse(response.body)
          result = Responses::SendSms.new(json)
          return result if result.success?

          raise result.to_error
        end

        # @param request [SmsRu::Requests::CodeCall, Hash]
        # @raise [SmsRu::Responses::CodeCall::Error]
        # @return [SmsRu::Responses::CodeCall]
        #
        def code_call(request)
          request = Requests::CodeCall.new(request) unless request.is_a?(Requests::CodeCall)
          response = http_post(CODE_CALL_PATH, params: request)
          json = JSON.parse(response.body)
          result = Responses::CodeCall.new(json)
          return result if result.success?

          raise result.to_error
        end
      end

      include Sms
    end
  end
end
