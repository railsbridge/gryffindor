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
      redirect_to(@event, :notice => 'Registration was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.xml
  def update
    @registration = Registration.find(params[:id])

    if @registration.user == current_user && params[:withdraw] == 'true'
      @registration.withdraw!
      redirect_to(@event, :notice => "Registration was withdrawn")
    else
      redirect_to(@event, :notice => 'Unsupported behavior')
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.xml
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to(registrations_url) }
      format.xml  { head :ok }
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
