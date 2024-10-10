# frozen_string_literal: true

require "rails_helper"

RSpec.describe StatusChangeComponent, type: :component do
  it "renders the status change details" do
    expect(
      render_inline(described_class.new(status: "In Progress", user_email: "test@test.com", created_at: Time.now)).to_html
    ).to include(
      "In Progress"
    ).and include(
      "Changed by test@test.com on"
    )
  end
end
