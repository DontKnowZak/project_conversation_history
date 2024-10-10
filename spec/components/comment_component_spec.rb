# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentComponent, type: :component do
  it "renders something useful" do
    expect(
      render_inline(described_class.new(body: "This is a comment", user_email: "test@test.com", created_at: Time.now)).to_html
    ).to include(
      "This is a comment"
    )
  end
end
