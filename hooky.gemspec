# frozen_string_literal: true

require_relative "lib/hooky/version"

Gem::Specification.new do |spec|
  spec.name = "hooky"
  spec.version = Hooky::VERSION
  spec.authors = ["Dean Perry"]
  spec.email = ["dean@deanpcmad.com"]

  spec.summary = "Hooky is a tool for testing webhooks"
  spec.homepage = "https://github.com/deanpcmad/hooky"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir["lib/**/*", "MIT-LICENSE", "README.md"]
  spec.executables = %w[ hooky ]

  spec.add_dependency "thor", '~> 1.3'
  spec.add_dependency "httparty", '~> 0.21.0'
end
