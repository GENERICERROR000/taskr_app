class EventsController < ApplicationController
  before_action :signed_in, except: [:index]
  before_action :find_event, only: [:show, :edit, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "you done created it~"
      redirect_to event_path(@event)
    else
      flash[:error] = "nerp!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:success] = "you done did it~"
      redirect_to event_path(@event)
    else
      flash[:error] = "no no no..."
      render :update
    end
  end

  def destroy
    @event.delete
    flash[:success] = "gewd jerb!"
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :address, :start_date, :end_date)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
