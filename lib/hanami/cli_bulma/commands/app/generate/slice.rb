# frozen_string_literal: true


module Hanami
  module CLIBulma
    module Commands
      module App
        module Generate
          # @since 0.0.1
          # @api private
          class Slice < Hanami::CLI::Commands::App::Generate::Slice
            # @since 0.0.1
            # @api private
            def initialize(
              fs:, inflector:,
              generator: Generators::App::Slice.new(fs: fs, inflector: inflector),
              **opts
            )
              super(fs: fs, inflector: inflector, generator: generator, **opts)
              @generator = generator
            end
          end
        end
      end
    end
  end
end
