# SmsRu

Ruby Client Library for working with [SMS.RU](https://sms.ru).

NOTE: current implementation does not support ALL features, and includes only:

  * Send SMS

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sms-ru-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sms-ru-client

## Configuration

```ruby
SmsRu.configure do |config|
  config.api_endpoint = 'https://sms.ru/'
  config.logger = Logger.new(STDERR)
  config.api_id = 'your api_id'
end
```

or

```ruby
client = SmsRu::Client.new(
  api_endpoint: 'https://sms.ru/'
  logger: Logger.new(STDERR)
  api_id: 'your api_id'
)
```

## Usage

### Send SMS

```ruby
request = SmsRu::Requests::SendSms.new(
  to: '79991234567',
  message: 'hello world',
  test: true
)

SmsRu.client.send_sms(request)
```

## Development

Setup:

```console
make setup
```

Run linters:

```console
make lint
```

Run tests:

```console
make test
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zabolotnov87/sms_ru. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Test project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/zabolotnov87/sms_ru/blob/master/CODE_OF_CONDUCT.md).
