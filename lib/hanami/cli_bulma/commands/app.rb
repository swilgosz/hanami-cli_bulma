# frozen_string_literal: true

module Hanami
  module CLIBulma
    module Commands
      # Commands made available when the `hanami` CLI is executed within an Hanami app.
      #
      # @api private
      # @since 0.0.1
      module App
        # @since 0.0.1
        # @api private
        def self.extended(base)
          base.module_eval do
            register "generate", aliases: ["g"] do |prefix|
              prefix.register "slice", Generate::Slice
              if Hanami.bundled?("hanami-controller")
                prefix.register "action", Generate::Action
              end

              if Hanami.bundled?("hanami-view")
                prefix.register "view", Generate::View
              end
            end
          end
        end
      end
    end
  end
end
