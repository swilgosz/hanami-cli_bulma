# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative "lib/hanami/cli_bulma/version"

Gem::Specification.new do |spec|
  spec.name          = "hanami-cli_bulma"
  spec.version       = Hanami::CLIBulma::VERSION
  spec.authors       = ["Sebastian Wilgosz"]
  spec.email         = ["sebastian@hanamimastery.com"]

  spec.summary       = "Hanami CLI generators extension for Bulma"
  spec.description   = "Hanami command line Bulma CSS Framework integration"
  spec.homepage      = "https://github.com/swilgosz/hanami-cli_bulma"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/swilgosz/hanami-cli_bulma"
  spec.metadata["changelog_uri"] = "https://github.com/swilgosz/hanami-cli_bulma/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }

  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.required_ruby_version = ">= 3.1"

  spec.add_dependency "bundler", "~> 2.1"
  spec.add_dependency "dry-cli", "~> 1.0", ">= 1.1.0"
  spec.add_dependency "hanami-cli", "~> 2.1"
  spec.add_dependency "zeitwerk", "~> 2.6"

  spec.add_development_dependency "dry-inflector", "~> 1.0", "< 2"
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency "rubocop", "~> 1.0"
end
