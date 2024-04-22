class Pilot::ShowComponent < ViewComponent::Base
  renders_many :items, "Pilot::ShowItemComponent"

  def initialize(record:, namespace:)
    @record = record
    @namespace = namespace
  end
end
