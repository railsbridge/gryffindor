class RegistrationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_event

  # GET /registrations
  # GET /registrations.xml
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.xml
  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.xml
  def new
    @registration = Registration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.xml
  def create
    @registration = Registration.new(params[:registration])
    @registration.user = current_user
    @registration.event = @event

    if @registration.save
      if !@registration.waitlisted?
        notice = "Success! You have registered for this event."
      else
        notice = "You have registered for this event, but you are on the waitlist."
      end
      redirect_to(@event, :notice => notice)
    else
      render :action => "new"
    end
  end

  def update
    @registration = Registration.find(params[:id])

    redirect_to(@event, :notice => 'Unsupported behavior')
  end

  def destroy
    @registration = Registration.find(params[:id])

    if @registration.user == current_user
      # don't actually destroy it, for record-keeping; instead, set withdrawn_at
      @registration.withdraw!
      redirect_to(@event, :notice => "Registration was withdrawn")
    else
      redirect_to(@event, :error => "You don't have permission to do that.")
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
