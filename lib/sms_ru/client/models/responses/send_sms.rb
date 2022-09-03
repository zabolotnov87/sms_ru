module SmsRu
  class Client
    module Models
      module Responses
        class SendSms < Base
          class Error < StandardError
            attr_reader :status, :code, :text

            def initialize(status, code, text)
              @status = status
              @code = code
              @text = text
              super("status: #{status}, code: #{code}, text: #{text}")
            end
          end

          SUCCESS_STATUS = 'OK'.freeze

          property :status
          property :code, from: 'status_code'
          property :text, from: 'status_text'
          property :balance

          def success?
            status == SUCCESS_STATUS
          end

          def to_error
            return if success?

            Error.new(status, code, text)
          end
        end
      end
    end
  end
end
