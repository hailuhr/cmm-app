class TaskTimesController < ApplicationController
  before_action :set_task_time, only: [:show, :edit, :update, :destroy]
  before_action :set_user


  def index
    @task_time = TaskTime.new
  end

  def new
    @task_time = TaskTime.new
  end

  def create
    binding.pry

    @task_time = TaskTime.new(clean_task_time_params)

    @task_time.user_id = @user.id
    if @task_time.save
      render :show
    else
      render :new
    end
  end

  def show

    if @task_time
      render :show
    else
      render root_path
    end
  end

  def edit
  end

  def update

    if @task_time.update(task_time_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @task_time.delete

    redirect_to root_path
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def set_user
    @user = current_user
  end

  def set_task_time
    @task_time = TaskTime.find_by(id: params[:id].to_i)
  end

  def formatted_start_date
    year_format = params["task_time"]["start_time(1i)"]
    year = "#{year_format[2]}#{year_format[3]}"
    month = params["task_time"]["start_time(2i)"]
    day = params["task_time"]["start_time(3i)"]
    hour = params["task_time"]["start_time(4i)"]
    minutes = params["task_time"]["start_time(5i)"]

    "#{hour}:#{minutes} #{day}/#{month}/#{year}"
  end

  def formatted_end_date
    year_format = params["task_time"]["end_time(1i)"]
    year = "#{year_format[2]}#{year_format[3]}"
    month = params["task_time"]["end_time(2i)"]
    day = params["task_time"]["end_time(3i)"]
    hour = params["task_time"]["end_time(4i)"]
    minutes = params["task_time"]["end_time(5i)"]

    "#{hour}:#{minutes} #{day}/#{month}/#{year}"
  end

 # Date.strptime( "#{month}/#{day}/#{year} #{hour}:#{minutes}", "%d/%m/%y %H:%M")
 # test = "#{hour}:#{minutes} #{day}/#{month}/#{year}"

  def task_time_params
    params.require(:task_time).permit(:start_time, :end_time, :notes, :task_id)
  end

  def clean_task_time_params
    start_time = DateTime.parse(formatted_start_date)
    end_time = DateTime.parse(formatted_end_date)

    {
      start_time: start_time,
      end_time: end_time,
      notes: task_time_params[:notes],
      task_id: task_time_params[:task_id].to_i
    }
  end
end
