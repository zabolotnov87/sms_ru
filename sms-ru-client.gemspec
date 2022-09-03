Gem::Specification.new do |spec|
  spec.required_ruby_version = '~> 3.0'
  spec.name                  = 'sms-ru-client'
  spec.version               = '1.0.1'
  spec.authors               = ['Sergey Zaboltonov']
  spec.email                 = ['sergey.zabolotnov@gmail.com']

  spec.summary               = 'Ruby Client Library for working with SMS.RU'
  spec.license               = 'MIT'
  spec.homepage              = 'https://github.com/zabolotnov87/sms_ru'

  spec.files                 = Dir['app/**/*', 'lib/**/*', 'config/**/*', 'README.md']
  spec.require_paths         = ['lib']

  spec.add_dependency 'faraday', '~> 2.0'
  spec.add_dependency 'hashie', '>= 3.4', '< 5.0'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
