# frozen_string_literal: true

module Hanami
  module CLIBulma
    module Commands
      module App
        module Generate
          # @since 0.0.1
          # @api private
          class Action < Hanami::CLI::Commands::App::Generate::Action
            # @since 0.0.1
            # @api private
            def initialize(
              fs:, inflector:,
              generator: Generators::App::Action.new(fs: fs, inflector: inflector),
              **opts
            )
              super(fs: fs, inflector: inflector, generator: generator, **opts)
            end
          end
        end
      end
    end
  end
end
