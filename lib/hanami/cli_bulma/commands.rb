# frozen_string_literal: true

require 'hanami/cli'

module Hanami
  module CLIBulma
    # Contains the commands available for the current `hanami` CLI execution, depending on whether
    # the CLI is executed inside or outside an Hanami app.
    #
    # @see .within_hanami_app?
    #
    # @api public
    # @since 0.0.1
    module Commands
    end

    # @api private
    def self.register_commands!(within_hanami_app = within_hanami_app?)
      commands =
        if within_hanami_app
          require "hanami/cli/commands/app"
          extend(Hanami::CLI::Commands::App)

          require_relative "commands/app"
          extend(Hanami::CLIBulma::Commands::App)
        else
          require "hanami/cli/commands/gem"
          extend(Hanami::CLI::Commands::Gem)
        end
    end
  end
end
