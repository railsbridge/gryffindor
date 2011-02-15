require 'spec_helper'

describe User do
  describe "saving" do
    it "downcases the email address" do
      Factory(:user, :email => "ALLCAPS@EXAMPLE.COM").reload.email.should == "allcaps@example.com"
    end

    it 'requires name and email' do
      Factory(:user).should be_valid
      Factory.build(:user, :name => nil).should_not be_valid
      Factory.build(:user, :email => nil).should_not be_valid
    end
  end

  describe 'a new user' do
    it 'has no roles' do
      Factory(:user).should have(0).roles
    end
  end

  describe '#role?' do
    it 'checks for role membership by name' do
      organizer = Factory(:organizer)
      organizer.role?(:organizer).should be_true
      organizer.role?(:admin).should be_false
    end
  end

  describe '#add_role' do
    it 'adds a role' do
      user, role = Factory(:user), Factory(:admin_role)
      user.add_role(role.name)
      user.roles.should eq [role]
    end

    it 'raises an exception for nonexistent roles' do
      proc { Factory(:user).add_role('boss') }.should raise_error ActiveRecord::RecordNotFound
    end
  end

  describe "#registered_for?" do
    before do
      @user = Factory(:user)
      @event = Factory(:event)
    end

    it "returns false if the user is not registered for event" do
      @user.registered_for?(@event).should be_false
    end

    it "returns true if the user is registered for event" do
      Factory(:registration, :event => @event, :user => @user)
      @user.registrations.reload
      @user.registered_for?(@event).should be_true
    end
  end
end
