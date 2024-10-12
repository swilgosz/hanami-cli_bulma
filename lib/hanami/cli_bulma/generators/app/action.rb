# frozen_string_literal: true

require "erb"

# rubocop:disable Metrics/ParameterLists
module Hanami
  module CLIBulma
    module Generators
      module App
        # @since 0.0.1
        # @api private
        class Action < Hanami::CLI::Generators::App::Action
          def template(path, context)
            require "erb"

            ERB.new(
              File.read(__dir__ + "/action/#{path}"), trim_mode: "-",
            ).result(context.ctx)
          end

          alias_method :t, :template
        end
      end
    end
  end
end
# rubocop:enable Metrics/ParameterLists
