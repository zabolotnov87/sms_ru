module SmsRu
  class Client
    module Models
      module Requests
        class SendSms < Base
          property :test, transform_with: ->(value) { '1' if value }
          property :msg, from: 'message'
          property :to, transform_with: lambda { |value|
            if value.is_a?(Array)
              value.join(',')
            else
              value
            end
          }
        end
      end
    end
  end
end
