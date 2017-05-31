class TasksController < ApplicationController
  before_action :signed_in, except: [:index]
  before_action :find_task, only: [:show, :edit, :update]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @event = Event.find(params[:event_id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "you done created it~"
      redirect_to task_path(@task)
    else
      flash[:error] = "nerp!"
      # render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "you done did it~"
      redirect_to task_path(@task)
    else
      flash[:error] = "no no no..."
      render :update
    end
  end

  def destroy
    @task.delete
    flash[:success] = "gewd jerb!"
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :task_location, :description, :priority, :event_id, :location_id)
  end



  def find_task
    @task = Task.find(params[:id])
  end

end
