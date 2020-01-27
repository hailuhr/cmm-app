class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render :show
    else
      render :new
    end
  end

  def show

    if @task
      render :show
    else
      render root_path
    end
  end

  def edit
  end

  def update

    if @task.update(task_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @task.delete

    redirect_to root_path
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def set_task
    @task = Task.find_by(id: params[:id].to_i)
  end

  def task_params
    params.require(:task).permit(:name, :description, :project_id)
  end
end
