module SmsRu
  class Client
    module Models
      module Responses
        class SendSms < Base
          class Error < StandardError
            attr_reader :status, :code
            def initialize(status, code)
              @status = status
              @code = code
              super("status: #{status}, code: #{code}")
            end
          end

          SUCCESS_STATUS = 'OK'.freeze

          property :status
          property :code, from: 'status_code'
          property :balance

          def success?
            status == SUCCESS_STATUS
          end

          def to_error
            return if success?

            Error.new(status, code)
          end
        end
      end
    end
  end
end
