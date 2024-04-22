# frozen_string_literal: true

class KwikScaffold::TurboframedComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(**options)
    @turbo = options.delete(:turbo)
    @name = options.delete(:name)
    @options = options
  end
end
