# frozen_string_literal: true

class Pilot::NoticeComponent < ViewComponent::Base
  def initialize(message:, auto_close: false)
    @message = message
    @auto_close = auto_close
  end

end
