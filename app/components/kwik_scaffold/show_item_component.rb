# frozen_string_literal: true

class KwikScaffold::ShowItemComponent < ViewComponent::Base
  def initialize(label:, value:)
    @label = label
    @value = value
  end

end
