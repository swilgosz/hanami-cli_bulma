# frozen_string_literal: true

require "hanami/env"
require_relative "db/utils/database"
require_relative "../../files"

module Hanami
  module CLIBulma
    module Commands
      module App
        # Base class for `hanami` CLI commands intended to be executed within an existing Hanami
        # app.
        #
        # @since 0.0.1
        # @api public
        class Command < Hanami::CLI::Commands::App::Command
        end
      end
    end
  end
end
