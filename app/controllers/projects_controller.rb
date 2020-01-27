class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new()
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render :show
    else
      render :new
    end
  end

  def show

    if @project
      render :show
    else
      render root_path
    end
  end

  def edit
  end

  def update

    if @project.update(project_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @project.delete

    redirect_to root_path
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def set_project
    @project = Project.find_by(id: params[:id].to_i)
  end

  def project_params
    params.require(:project).permit(:name, :client_id)
  end
end
