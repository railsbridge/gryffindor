require 'spec_helper'

describe "Registering for an event" do
  include CoreHelper
  include RegistrationHelper

  before :each do
    @user = login_as_admin
    @event = Factory(:event)
    click_link "Events"
  end

  context "displaying question types" do
    it "should correctly show a text type" do
      Factory.create(:text_question, :event => @event)
      click_link "Register"
      page.find(:css, "input[type='text']").should_not be_nil
    end

    it "should correctly show a select type" do
      Factory.create(:select_question, :event => @event)
      click_link "Register" 
      page.find(:css, "select").should_not be_nil
    end
    
    it "should correctly show a radio type" do
      Factory.create(:radio_question, :event => @event)
      click_link "Register"
      page.find(:css, "input[type='radio']").should_not be_nil
    end
    
    it "should correctly show a checkbox type" do
      Factory.create(:check_boxes_question, :event => @event)
      click_link "Register"
      page.find(:css, "input[type='checkbox']").should_not be_nil
    end

    it "should correctly register a user with their answers to custom questions" do
      Factory.create(:select_question, :event => @event)
      click_link "Register"
      select "bar", :from => "registration[answers_attributes][0][answer_text]"
      click_button "Save"
      page.should have_content "Success!"
    end
  end
end
