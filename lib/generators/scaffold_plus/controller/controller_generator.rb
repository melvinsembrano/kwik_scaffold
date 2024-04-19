class ScaffoldPlus::ControllerGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers

  source_root File.expand_path("templates", __dir__)

  check_class_collision suffix: "Controller"

  class_option :orm,
    banner: "NAME",
    type: :string, required: true,
    desc: "ORM to generate the controller for"

  argument :attributes, type: :array, default: [], banner: "field:type field:type"

  # create controller file using rails scaffold_controller controller template
  def create_controller_file
    ScaffoldPlus::ControllerGenerator.source_root File.join(Gem.loaded_specs["railties"].full_gem_path, "lib/rails/generators/rails/scaffold_controller/templates")
    template "controller.rb", File.join("app/controllers", controller_class_path, "#{controller_file_name}_controller.rb")
  end

  hook_for :test_framework, as: :scaffold

  private

    def permitted_params
      attachments, others = attributes_names.partition { |name| attachments?(name) }
      params = others.map { |name| ":#{name}" }
      params += attachments.map { |name| "#{name}: []" }
      params.join(", ")
    end

    def attachments?(name)
      attribute = attributes.find { |attr| attr.name == name }
      attribute&.attachments?
    end
end
