class KwikScaffold::ShowComponent < ViewComponent::Base
  renders_many :items, "KwikScaffold::ShowItemComponent"

  def initialize(record:, namespace:)
    @record = record
    @namespace = namespace
  end
end
