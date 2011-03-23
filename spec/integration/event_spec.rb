require 'spec_helper'

describe "Creating a new event" do
  include CoreHelper
  include EventHelper
  
  before :each do
    @admin = login_as_admin
    @location = Factory(:location)
    visit new_event_path
  end

  it "should not be able to create an event without filling out all the fields" do
    click_button "Save"
    Event.find(:all).length.should == 0
  end

  it "should create the correct question type upon creation" do
    create_event
    click_button "Save"
    Event.find(:all).first.questions.first.type.should == "TextQuestion"
  end

  it "should be able to create multiple questions dynamically" do
    click_link "Add Question"
    create_event
    fill_in "event[questions_attributes][1][question_text]", :with => "check something : okay, no"
    select "CheckBoxesQuestion", :from => "event[questions_attributes][1][type]"
    click_button "Save"
    Event.find(:all).first.questions.length.should == 2
  end
end
