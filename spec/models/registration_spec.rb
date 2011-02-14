require 'spec_helper'

describe Registration do

  before do
    @user = Factory(:user)
    @event = Factory(:event)
  end

  it "should not allow users to register for the same event twice" do
    Registration.create(:user => @user, :event => @event)
    Registration.new(:user => @user, :event => @event).should_not be_valid
  end

end
