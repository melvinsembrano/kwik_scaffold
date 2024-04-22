# frozen_string_literal: true

class KwikScaffold::TabComponent < ViewComponent::Base
  def initialize(parent:, title:, path:)
    @parent = [ parent, { tab: title.underscore } ].flatten
    @title = title
    @path = path
  end
end
