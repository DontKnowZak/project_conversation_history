# frozen_string_literal: true

class StatusChangeComponent < ViewComponent::Base
  def initialize(status:, user_email:, created_at:)
    @status = status
    @user_email = user_email
    @created_at = created_at
  end
end
