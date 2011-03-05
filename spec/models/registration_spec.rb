require 'spec_helper'

describe Registration do

  before do
    @user = Factory(:user)
    @event = Factory(:event)
  end

  it "should set withdrawn_at to the present time when #withdraw! is called" do
    registration = Factory(:registration, :user => @user, :event => @event)
    registration.withdraw!
    registration.reload.withdrawn_at.should > Time.now - 5.seconds
  end

  it "should not allow users to register for the same event twice" do
    old_registration = Factory(:registration, :user => @user, :event => @event)
    Factory.build(:registration, :user => @user, :event => @event).should_not be_valid
  end

  it "should allow user to register for event again if previous registration has been withdrawn" do
    old_registration = Factory(:registration, :user => @user, :event => @event)
    old_registration.withdraw!

    Factory.build(:registration, :user => @user, :event => @event).should be_valid
  end

  describe "setting its waitlisted status" do
    before do
      @event.capacity = 1
      @event.save
    end

    it "sets waitlisted to false if event is not full" do
      registration = Factory(:registration, :user => @user, :event => @event)
      registration.should_not be_waitlisted
    end

    it "sets waitlisted to true if event is full" do
      Factory(:registration, :event => @event)
      registration = Factory(:registration, :user => @user, :event => @event)
      registration.should be_waitlisted
    end
  end

  describe "updating associated Event" do

    it "should increment event.active_registrations_count when new registration is created" do
      registration = Factory(:registration, :user => @user, :event => @event)
      @event.reload.active_registrations_count.should == 1
    end

    it "should decrement event.active_registrations_count when registration is withdrawn" do
      registration = Factory(:registration, :user => @user, :event => @event)
      @event.reload.active_registrations_count.should == 1

      registration.withdrawn_at = Time.now
      registration.save
      @event.reload.active_registrations_count.should == 0
    end
  end

  context "validation" do
    it "should not validate with unanswered questions" do
      Factory.create(:question, :question_text => "can you pass this?", :event => @event)
      @event.reload
      registration = Factory.build(:registration, :user => @user, :event => @event)
      registration.should_not be_valid
    end
  end
end
