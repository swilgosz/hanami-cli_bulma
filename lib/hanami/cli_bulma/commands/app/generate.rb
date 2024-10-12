# frozen_string_literal: true

module Hanami
  module CLIBulma
    module Commands
      module App
        # @since 0.0.1
        # @api private
        module Generate
          require_relative "generate/slice"
          require_relative "generate/action"
        end
      end
    end
  end
end
