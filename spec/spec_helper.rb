require 'bundler/setup'
require 'pry'
require 'vcr'

require 'sms_ru'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :faraday
  config.filter_sensitive_data('<API_ID>') { test_api_id }
  config.filter_sensitive_data('<PHONE>') { test_phone }
end

def test_api_id
  ENV.fetch('API_ID', 'test_api_id')
end

def test_phone
  ENV.fetch('PHONE', '79811234567')
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:example) do
    SmsRu.configure do |sms_ru|
      sms_ru.api_endpoint = ENV.fetch('API_ENDPOINT', 'https://sms.ru/')
      sms_ru.api_id = test_api_id
      sms_ru.logger = Logger.new($stderr)
    end
  end
end
