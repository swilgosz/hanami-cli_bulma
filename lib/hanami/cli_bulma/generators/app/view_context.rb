# frozen_string_literal: true

module Hanami
  module CLIBulma
    module Generators
      # @since 2.1.0
      # @api private
      module App
        # @since 2.1.0
        # @api private
        class ViewContext < Hanami::CLI::Generators::App::ViewContext
          def crud?
            %w[new edit index show].include?(name)
          end
        end
      end
    end
  end
end
