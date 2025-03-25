require_relative 'models/requests/base'
require_relative 'models/requests/send_sms'
require_relative 'models/requests/code_call'

require_relative 'models/responses/base'
require_relative 'models/responses/send_sms'
require_relative 'models/responses/code_call'

module SmsRu
  Requests = Client::Models::Requests
  Responses = Client::Models::Responses
end
