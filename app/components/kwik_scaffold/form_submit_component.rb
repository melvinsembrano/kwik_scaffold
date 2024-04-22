class KwikScaffold::FormSubmitComponent < ViewComponent::Base
  def initialize(form:, cancel_path:)
    @form = form
    @cancel_path = cancel_path
  end
end
