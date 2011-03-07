require 'spec_helper'

describe "Creating a new event" do
  include CoreHelper
  
  before :each do
    @admin = login_as_admin
  end

  it "should not be able to create an event without filling out all the fields" do
    visit new_event_path
    click_button "Save"
    page.should have_content "error"
  end
end
