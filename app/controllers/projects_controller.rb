class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show update]

  def index
    @projects = Project.all
  end

  def show
    @comments = @project.comments
    @status_changes = @project.status_changes
    @activities = (@comments + @status_changes).sort_by(&:created_at).reverse
  end

  def update
    if @project.update(project_params)
      if @project.previous_changes[:status]
        StatusChange.create!(status: @project.status, user: current_user, project: @project)
        redirect_to @project, notice: "Project status updated."
      end
    else
      @comments = @project.comments.order(created_at: :desc)
      @status_changes = @project.status_changes.order(created_at: :desc)
      render :show
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:status)
  end
end
