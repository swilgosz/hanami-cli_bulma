# frozen_string_literal: true

require "bundler"
require "open3"
require "etc"

module Hanami
  module CLIBulma
    # Conveniences for running `bundler` from CLI commands.
    #
    # @since 0.0.1
    # @api public
    class Bundler < Hanami::CLI::Bundler
    end
  end
end
