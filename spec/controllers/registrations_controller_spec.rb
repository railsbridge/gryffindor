require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe RegistrationsController do
  render_views

  before do
    @user = Factory(:user)
    sign_in @user

    @location = Factory(:location)
    @event = Factory(:event, :location_id => @location.id)
  end

  describe "new" do
    it "should render" do
      get :new, :event_id => @event.id
      response.should be_success
    end
  end

  describe "create" do
    it "should redirect to registration page" do
      post :create, :event_id => @event.id, :registration => {}
      response.should redirect_to(event_path(@event))
    end

    it "should save a new registration for the current user" do
      post :create, :event_id => @event.id, :registration => {}
      registration = Registration.last
      registration.user.should == @user
    end


  end

end
