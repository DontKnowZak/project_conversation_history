class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show]

  def index
    @projects = Project.all
  end

  def show
    @comments = @project.comments.order(created_at: :desc)
    @status_changes = @project.status_changes.order(created_at: :desc)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
