# frozen_string_literal: true

class Pilot::ShowItemComponent < ViewComponent::Base
  def initialize(label:, value:)
    @label = label
    @value = value
  end

end
