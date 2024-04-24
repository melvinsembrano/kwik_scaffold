class KwikScaffoldGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers

  source_root File.expand_path("templates", __dir__)

  class_option :helper, type: :boolean
  class_option :orm, banner: "NAME", type: :string, required: true,
                      desc: "ORM to generate the controller for"

  class_option :skip_routes, type: :boolean, desc: "Don't add routes to config/routes.rb."

  argument :attributes, type: :array, default: [], banner: "field:type field:type"

  def create_controller
    invoke "kwik_scaffold:controller", [ name ], options
  end

  def create_views
    invoke "kwik_scaffold:views", [ name ], options
  end

  def add_routes
    return if options[:skip_routes]

    route "resources :#{file_name.pluralize}", namespace: controller_class_path
  end
end
