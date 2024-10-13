# frozen_string_literal: true

require "erb"

module Hanami
  module CLIBulma
    module Generators
      module App
        # @since 0.0.1
        # @api private
        class View < Hanami::CLI::Generators::App::View
          def call(app, key, format, slice)
            context = ViewContext.new(inflector, app, slice, key)

            if slice
              generate_for_slice(context, format, slice)
            else
              generate_for_app(context, format, slice)
            end
          end

          private

          def generate_for_slice(context, format, slice)
            base_directory = fs.join("slices", slice)
            raise MissingSliceError.new(slice) unless fs.directory?(base_directory)

            generate(base_directory, "slice", context, format)
          end

          def generate_for_app(context, format)
            base_directory = fs.join("app")

            generate(base_directory, "app", context, format)
          end

          def generate(base_directory, template_prefix, context, format)
            # generate view folder
            directory = fs.join(base_directory, "views", context.namespaces)
            fs.mkdir(directory)

            # generate view file
            template_name = context.crud? ? "#{template_prefix}_view-#{context.name}.erb" : "#{template_prefix}_view.erb"
            fs.write(fs.join(directory, "#{context.name}.rb"), t(template_name, context))

            # generate template folder
            directory = fs.join(base_directory, "templates", context.namespaces)
            fs.mkdir(directory)

            # generate template file
            template_name = context.crud? ? "#{template_prefix}_template-#{context.name}" : "#{template_prefix}_template"
            fs.write(
              fs.join(directory, "#{context.name}.#{format}.erb"),
              t(template_with_format_ext(template_name, format), context)
            )
          end

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
