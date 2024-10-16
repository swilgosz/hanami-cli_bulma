# frozen_string_literal: true

require "hanami/cli_bulma"
require "pathname"

SPEC_ROOT = Pathname(File.expand_path(__dir__)).freeze

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.before :suite do
  #   require "hanami/devtools/integration"
  #   Pathname.new(Dir.pwd).join("tmp").mkpath
  # end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus
  config.disable_monkey_patching!
  config.warnings = false

  config.default_formatter = "doc" if config.files_to_run.one?

  config.order = :random
  Kernel.srand config.seed

  RSpec.shared_context "app" do
    let(:app) do
      Test::App
    end
  end

  RSpec.shared_context "command" do
    subject(:command) { described_class.new(out: out) }

    let(:out) { StringIO.new }

    let(:output) {
      out.rewind
      out.read
    }
  end

  config.include_context("command", command: true)
  config.include_context("app", app: true)

  config.around(app: true) do |example|
    require_relative "fixtures/test/config/app" unless defined?(Test::App)
    example.run
    $LOADED_FEATURES.delete(SPEC_ROOT.join("fixtures/test/config/app.rb").to_s)
  end

  RSpec::Matchers.define_negated_matcher :not_change, :change
end

Dir.glob("#{__dir__}/support/**/*.rb").each { require _1 }
