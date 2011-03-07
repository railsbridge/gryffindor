require 'spec_helper'

describe "Creating a new event" do
  include CoreHelper
  include EventHelper
  
  before :each do
    @admin = login_as_admin
  end

  it "should not be able to create an event without filling out all the fields" do
    visit new_event_path
    click_button "Save"
    Event.find(:all).length.should == 0
  end

  it "should create the correct question type upon creation" do
    visit new_event_path
    create_event
  end
end
