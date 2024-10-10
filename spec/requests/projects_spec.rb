require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let!(:user) { User.create!(email: 'user@test.com', password: 'password') }
  let!(:project) { Project.create!(name: 'Amazing project', description: 'Groundbreaking new feature', status: 'Not Started') }
  let!(:project_2) { Project.create!(name: 'Another project', description: 'Less impressive new feature', status: 'Not Started') }

  before do
    sign_in user
  end

  describe "GET /projects" do
    it "renders the index page with the list of projects" do
      get projects_path

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Projects List')
      expect(response.body).to include('Amazing project')
      expect(response.body).to include('Groundbreaking new feature')
      expect(response.body).to include('Another project')
      expect(response.body).to include('Less impressive new feature')
    end
  end

  describe "GET /projects/:id" do
    it "renders the project show page with project details" do
      get project_path(project)

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Amazing project')
      expect(response.body).to include('Groundbreaking new feature')
      expect(response.body).to include('Not Started')
    end
  end
end
