# frozen_string_literal: true

class Pilot::TableComponent < ViewComponent::Base
  include Pagy::Frontend
  include Turbo::FramesHelper

  renders_one :header, -> do
    Pilot::TableHeaderComponent.new(columns: @columns)
  end

  renders_one :new_link, ->(url:, title: "Add #{@title.singularize}", overlay: false) do
    Pilot::TableNewLinkComponent.new(url:, overlay:, title:)
  end

  renders_one :filter, ->(model:) do
    Pilot::TableFilterComponent.new(model:)
  end

  renders_one :rows, ->(collection:, namespace: []) do
    Pilot::TableRowsComponent.new(collection:, columns: @columns, namespace:)
  end

  renders_one :footer, ->(pagy:) do
    Pilot::TableFooterComponent.new(pagy:)
  end

  def initialize(title:, columns: [], description: "", classes: "")
    @title = title
    @description = description
    @classes = classes

    @columns = columns
  end
end
