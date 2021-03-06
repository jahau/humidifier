# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'humidifier/version'

Gem::Specification.new do |spec|
  spec.name          = 'humidifier'
  spec.version       = Humidifier::VERSION
  spec.authors       = ['Kevin Deisz']
  spec.email         = ['kevin.deisz@gmail.com']

  spec.summary       = 'CloudFormation made easy'
  spec.description   = 'Programmatically generate and manage AWS ' \
                       'CloudFormation templates, stacks, and change sets.'
  spec.homepage      = 'https://github.com/kddeisz/humidifier'
  spec.license       = 'MIT'

  spec.files         = Dir['LICENSE', 'README.md', 'lib/**/*',
                           'CloudFormationResourceSpecification.json']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4'

  spec.add_dependency 'aws-sdk-cloudformation', '~> 1.25'
  spec.add_dependency 'aws-sdk-s3', '~> 1.48'
  spec.add_dependency 'fast_underscore', '~> 0.3'
  spec.add_dependency 'thor', '~> 1.0'
  spec.add_dependency 'thor-hollaback', '~> 0.2'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.13'
  spec.add_development_dependency 'nokogiri', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 0.77'
  spec.add_development_dependency 'simplecov', '~> 0.17'
  spec.add_development_dependency 'yard', '~> 0.9'
end
