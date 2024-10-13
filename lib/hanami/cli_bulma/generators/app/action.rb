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
          def call(app, controller, action, url, http, format, skip_view, slice, context: nil)
            context ||= Hanami::CLI::Generators::App::ActionContext.new(inflector, app, slice, controller, action)
            if slice
              generate_for_slice(controller, action, url, http, format, skip_view, slice, context)
            else
              generate_for_app(controller, action, url, http, format, skip_view, context)
            end

            view_directory = fs.join("app", "views", controller)
            if generate_view?(skip_view, action, view_directory)
              view_generator = Generators::App::View.new(fs: fs, inflector: inflector)
              view_name = [action, controller].join(Hanami::CLI::Commands::App::Command::ACTION_SEPARATOR)
              view_generator.call(app, view_name, format, slice)
            end
          end

          private

          # rubocop:disable Metrics/AbcSize
          def generate_for_slice(controller, action, url, http, format, skip_view, slice, context)
            slice_directory = fs.join("slices", slice)
            raise Hanami::CLI::Errors::MissingSliceError.new(slice) unless fs.directory?(slice_directory)

            fs.inject_line_at_block_bottom(
              fs.join("config", "routes.rb"),
              slice_matcher(slice),
              route(controller, action, url, http)
            )

            fs.mkdir(directory = fs.join(slice_directory, "actions", controller))
            fs.write(fs.join(directory, "#{action}.rb"), t("slice_action.erb", context))
          end

          def generate_for_app(controller, action, url, http, format, skip_view, context)
            fs.inject_line_at_class_bottom(
              fs.join("config", "routes.rb"),
              "class Routes",
              route(controller, action, url, http)
            )

            fs.mkdir(directory = fs.join("app", "actions", controller))
            fs.write(fs.join(directory, "#{action}.rb"), t("action.erb", context))
          end
          # rubocop:enable Metrics/AbcSize

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
