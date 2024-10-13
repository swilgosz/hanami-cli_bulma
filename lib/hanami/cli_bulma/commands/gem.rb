# frozen_string_literal: true

module Hanami
  module CLIBulma
    module Commands
      # Commands made available when the `hanami` CLI is executed outside of an Hanami app.
      #
      # @since 2.0.0
      # @api public
      module Gem
        # @since 2.0.0
        # @api private
        def self.extended(base)
          base.module_eval do
            register "new", Commands::Gem::New
          end
        end
      end
    end
  end
end
