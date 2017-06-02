class TasksController < ApplicationController
  before_action :signed_in
  before_action :find_task, only: [:show, :edit, :update, :destroy, :add_task, :complete_task, :remove_task, :validate_event]

  def new
    @task = Task.new
    @event = Event.find(params[:event_id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "You Made A Task"
      redirect_to task_path(@task)
    else
      flash[:error] = "Making A Task Didn't Work"
      # render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "Task Changes Were Applied"
      redirect_to task_path(@task)
    else
      flash[:error] = "Task Updated Failed Yo"
      render :update
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "Destroyed Dat Task"
    redirect_to root_path
  end

  def add_task
    @task.update(user: current_user, status: "in progress")
    redirect_to event_path(@task.event)
  end

  # def add_task
  #   if validate_event
  #     @task.update(user: current_user, status: "in progress")
  #     redirect_to event_path(@task.event)
  #   else
  #     flash[:error] = "This event conflicts with your current schedule!"
  #     redirect_to task_path(@task)
  #   end
  # end

  # def validate_event
  #   current_user.events.each do |e|
  #     if e.end_date < @task.event.start_date || @task.event.end_date < e.start_date
  #       puts true
  #     end
  #   end
  #   false
  # end
#only an option if task.user_id == current_user.id && only an option if the task status is pending

  def complete_task
    @task.update(status: "complete")
    redirect_to event_path(@task.event)
  end

  def remove_task
    @task.update(user: nil, status: "open")
    redirect_to event_path(@task.event)
  end

  private

  def task_params
    params.require(:task).permit(:title, :task_location, :description, :priority, :event_id, :location_id, :status)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
