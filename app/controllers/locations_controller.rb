class LocationsController < ApplicationController
  authorize_resource
  skip_authorize_resource :only => :index

  # GET /locations/
  def index
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /locations/new
  def new
    @location = Location.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # POST /locations
  def create
    @location = Location.new(params[:location])

    if @location.save
      flash[:notice] = 'The location was saved successfully.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  # GET /locations/1
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # PUT /locations/1
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to(@location) }
      else
        format.html { render :action => 'edit' }
      end
    end
  end

  # DELETE /locations/1
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
    end
  end
end
