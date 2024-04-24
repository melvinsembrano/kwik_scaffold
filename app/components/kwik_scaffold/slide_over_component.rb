class KwikScaffold::SlideOverComponent < ViewComponent::Base
  def initialize(title:, classes: "")
    @title = title
    @classes = classes
  end
end
