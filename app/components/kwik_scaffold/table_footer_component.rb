# frozen_string_literal: true

class KwikScaffold::TableFooterComponent < ViewComponent::Base
  def initialize(pagy:)
    @pagy = pagy
  end

end
