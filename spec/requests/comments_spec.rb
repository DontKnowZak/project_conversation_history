require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let!(:user) { User.create!(email: 'user@test.com', password: 'password') }
  let!(:project) { Project.create!(name: 'Project', description: 'Description for Project', status: 'Not Started') }

  before do
    sign_in user
  end

  describe "POST /projects/:project_id/comments" do
    it "creates a new comment and redirects to the project view" do
      post project_comments_path(project), params: { comment: { content: 'This is a comment' } }

      expect(response).to redirect_to(project_path(project))
      follow_redirect!

      expect(response).to have_http_status(:success)
      expect(response.body).to include('This is a comment')
    end
  end
end
