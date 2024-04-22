# frozen_string_literal: true

class Pilot::TabsComponent < ViewComponent::Base
  include Turbo::FramesHelper

  renders_many :tabs, ->(title:, path:) do
    @tabs[title.underscore] = path
    Pilot::TabComponent.new(parent: @parent, title:, path:)
  end

  def initialize(parent:)
    @parent = parent
    @tabs = {}
  end
end
