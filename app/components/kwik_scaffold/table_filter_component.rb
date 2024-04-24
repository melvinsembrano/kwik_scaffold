# frozen_string_literal: true

class KwikScaffold::TableFilterComponent < ViewComponent::Base
  def initialize(model:)
    @model = model
  end

end
