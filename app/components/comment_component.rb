# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
  def initialize(body:, user_email:, created_at:)
    @content = body
    @user_email = user_email
    @created_at = created_at
  end
end
