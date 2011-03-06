require 'spec_helper'

describe "Registering for an event" do
  include CoreHelper
  include RegistrationHelper

  before :each do
    @user = login_as_user
    @event = Factory(:event)
    click_link "Events"
  end

  context "displaying question types" do
    it "should correctly show a text type" do
      create_event_question(Factory(:text_question), @event)
      page.find(:css, "input[type='text']").should_not be_nil
    end

    it "should correctly show a select type" do 
      create_event_question(Factory(:select_question), @event)
      page.find(:css, "select").should_not be_nil
    end
    
    it "should correctly show a radio type"
    it "should correctly show a checkbox type"
  end
end
