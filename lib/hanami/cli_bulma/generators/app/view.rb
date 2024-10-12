# frozen_string_literal: true

require "erb"

module Hanami
  module CLIBulma
    module Generators
      module App
        # @since 0.0.1
        # @api private
        class View < Hanami::CLI::Generators::App::View
          # @since 0.0.1
          # @api private
          def template(path, context)
            require "erb"

            ERB.new(
              File.read(__dir__ + "/view/#{path}")
            ).result(context.ctx)
          end

          alias_method :t, :template
        end
      end
    end
  end
end
