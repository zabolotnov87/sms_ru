require 'spec_helper'

RSpec.describe SmsRu do
  it 'sends sms successfully' do
    VCR.use_cassette('sends_sms_successully') do
      sms = SmsRu::Requests::SendSms.new.tap do |request|
        request.to = test_phone
        request.message = 'hello world'
      end

      result = SmsRu.client.send_sms(sms)
      expect(result).to be_a(SmsRu::Client::Models::Responses::SendSms)
      expect(result.success?).to eq(true)
      expect(result.code).to eq(100)
    end
  end

  it 'code call successfully' do
    VCR.use_cassette('code_call_successully') do
      sms = SmsRu::Requests::CodeCall.new.tap do |request|
        request.to = test_phone
        request.ip = '71.173.10.25'
      end

      result = SmsRu.client.code_call(sms)
      expect(result).to be_a(SmsRu::Client::Models::Responses::CodeCall)
      expect(result.success?).to eq(true)
      expect(result.code).to eq(5289)
    end
  end
end
