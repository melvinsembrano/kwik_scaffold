# frozen_string_literal: true

class KwikScaffold::NoticeComponent < ViewComponent::Base
  def initialize(message:, auto_close: false)
    @message = message
    @auto_close = auto_close
  end

end
