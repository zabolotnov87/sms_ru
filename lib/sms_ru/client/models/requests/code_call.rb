module SmsRu
  class Client
    module Models
      module Requests
        class CodeCall < Base
          property :phone, from: 'to'
          property :ip
        end
      end
    end
  end
end
