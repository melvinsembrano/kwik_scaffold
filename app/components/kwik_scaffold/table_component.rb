# frozen_string_literal: true

class KwikScaffold::TableComponent < ViewComponent::Base
  include Pagy::Frontend
  include Turbo::FramesHelper

  renders_one :header, -> do
    KwikScaffold::TableHeaderComponent.new(columns: @columns)
  end

  renders_one :new_link, ->(url:, title: "Add #{@title.singularize}", overlay: false) do
    KwikScaffold::TableNewLinkComponent.new(url:, overlay:, title:)
  end

  renders_one :filter, ->(model:) do
    KwikScaffold::TableFilterComponent.new(model:)
  end

  renders_one :rows, ->(collection:, namespace: []) do
    KwikScaffold::TableRowsComponent.new(collection:, columns: @columns, namespace:)
  end

  renders_one :footer, ->(pagy:) do
    KwikScaffold::TableFooterComponent.new(pagy:)
  end

  def initialize(title:, columns: [], description: "", classes: "")
    @title = title
    @description = description
    @classes = classes

    @columns = columns
  end
end
