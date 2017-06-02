class EventsController < ApplicationController
  before_action :signed_in, except: [:index]
  before_action :admin, except: [:index, :show]
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.order("start_date")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if params[:event][:locations]["locations"].empty?
      flash[:error] = "At Least One Location Is Required - So Do That!"
      render :new
    elsif
      @event.save
      flash[:success] = "Event Was Created - So That's Cool."
      redirect_to event_path(@event)
    else
      flash[:error] = "Event No Created - I Don't Why..."
      render :new
    end

    params[:event][:locations]["locations"].split(", ").each do |location|
      Location.create(name: location, event_id: @event.id)

    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:success] = "Changes Applied - Solid."
      redirect_to event_path(@event)
    else
      flash[:error] = "So The Changes Couldn't Be Applied..."
      render :update
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "Event Destroyed - Do You Feel All Mighty And Powerful Now!?"
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :address, :start_date, :end_date, :locations)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
