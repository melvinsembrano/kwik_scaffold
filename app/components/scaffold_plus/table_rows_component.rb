# frozen_string_literal: true

class Pilot::TableRowsComponent < ViewComponent::Base
  def initialize(collection:, columns:, namespace: [])
    @collection = collection
    @columns = columns
    @namespace = namespace
  end
end
