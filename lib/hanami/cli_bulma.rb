# frozen_string_literal: true

require "dry/cli"
require "zeitwerk"

module Hanami
  # Extensible command line interface for Hanami.
  #
  # @api public
  # @since 0.0.1
  module CLIBulma
    def self.within_hanami_app?
      require "hanami"

      !!Hanami.app_path
    rescue LoadError => e
      raise e unless e.path == "hanami"

      # If for any reason the hanami gem isn't installed, make a simple best effort to determine
      # whether we're inside an app.
      File.exist?("config/app.rb") || File.exist?("app.rb")
    end

    # @api private
    # @since 0.0.1
    def self.gem_loader
      @gem_loader ||= Zeitwerk::Loader.new.tap do |loader|
        root = File.expand_path("..", __dir__)
        loader.tag = "hanami-cli_bulma"
        loader.inflector = Zeitwerk::GemInflector.new("#{root}/hanami-cli_bulma.rb")
        loader.push_dir(root)
        loader.ignore(
          "#{root}/hanami-cli_bulma.rb",
          "#{root}/hanami/cli_bulma/{errors,version}.rb"
        )
        loader.inflector.inflect("cli_bulma" => "CLIBulma")
        loader.inflector.inflect("cli" => "CLI")
        loader.inflector.inflect("db" => "DB")
        loader.inflector.inflect("url" => "URL")
      end
    end

    gem_loader.setup

    extend Dry::CLI::Registry
    require_relative "cli_bulma/commands"

    register_commands!
  end
end
