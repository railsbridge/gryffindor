class EventsController < ApplicationController

  authorize_resource
  skip_authorize_resource :only => :index


  def index
    @events = Event.order('start_time DESC').all
  end

  def new
    @event = Event.new
    @locations = Location.all
  end

  def create
    @event = Event.new(params[:event])

    if @event.save
      flash[:notice] = 'The event was saved successfully.'
      redirect_to :action => 'index'
    else
      @locations = Location.all
      render :action => 'new'
    end
  end

  def edit
  end

  def update
  end
  
  def show
    @event = Event.find params[:id]
  end



end