# frozen_string_literal: true

class KwikScaffold::TableNewLinkComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(url:, title:, overlay: false)
    @url = url
    @overlay = overlay
    @title = title
  end
end
