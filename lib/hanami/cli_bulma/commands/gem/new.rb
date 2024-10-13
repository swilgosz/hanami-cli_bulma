# frozen_string_literal: true

module Hanami
  module CLIBulma
    module Commands
      module Gem
        # @since 2.0.0
        # @api private
        class New < Hanami::CLI::Commands::Gem::New
          # @since 2.0.0
          # @api private
          def initialize(
            fs:, inflector:,
            bundler: CLIBulma::Bundler.new(fs: fs),
            generator: Generators::Gem::App.new(fs: fs, inflector: inflector),
            system_call: Hanami::CLI::SystemCall.new,
            **opts
          )
            super(fs: fs, inflector: inflector, **opts)
            @bundler = bundler
            @generator = generator
            @system_call = system_call
          end
        end
      end
    end
  end
end
