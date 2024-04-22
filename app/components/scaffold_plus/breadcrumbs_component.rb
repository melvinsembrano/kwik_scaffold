class Pilot::BreadcrumbsComponent < ViewComponent::Base
  def initialize(breadcrumb:)
    @breadcrumb = breadcrumb
  end

end
