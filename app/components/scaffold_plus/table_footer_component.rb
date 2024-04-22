# frozen_string_literal: true

class Pilot::TableFooterComponent < ViewComponent::Base
  def initialize(pagy:)
    @pagy = pagy
  end

end
