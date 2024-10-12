# frozen_string_literal: true

require "erb"

module Hanami
  module CLIBulma
    module Generators
      module App
        # @since 2.0.0
        # @api private
        class Slice < Hanami::CLI::Generators::App::Slice
          def template(path, context)
            require "erb"

            ERB.new(
              File.read(__dir__ + "/slice/#{path}"),
              trim_mode: "-"
            ).result(context.ctx)
          end

          alias_method :t, :template
        end
      end
    end
  end
end
