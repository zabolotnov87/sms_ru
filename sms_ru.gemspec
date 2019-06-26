lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sms_ru/version'

Gem::Specification.new do |spec|
  spec.name          = 'sms_ru'
  spec.version       = SmsRu::VERSION
  spec.authors       = ['Sergey Zaboltonov']
  spec.email         = ['sergey.zabolotnov@gmail.com']

  spec.summary       = 'Ruby Client Library for working with SMS.RU'
  spec.license       = 'MIT'

  spec.files         = Dir['app/**/*', 'lib/**/*', 'config/**/*', 'README.md']
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_dependency 'hashie', '~> 3.4'
end
