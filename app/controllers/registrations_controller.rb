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
    
    guest_registrations = []
    if params[:guests]
      (params[:guests].size / 2).times do |n| # lol
        next unless params[:guests]["guest_name_#{n}"].present? && params[:guests]["guest_name_#{n}"].present?
        
        guest_registration = Registration.new( :event => @event, :inviter_id => current_user.id )
        guest_registration.guest_name = params[:guests]["guest_name_#{n}"]
        guest_registration.guest_email = params[:guests]["guest_email_#{n}"]
        guest_registrations << guest_registration
      end
    end

    if @registration.valid? && guest_registrations.all? { |g| g.valid? }
      @registration.save and guest_registrations.each { |g| g.save }
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
