require 'spec_helper'

describe Event do

  it "should validate that capacity is a positive number" do
    event = Factory.build(:event, :capacity => -1)
    event.should_not be_valid

    event.capacity = "foo"
    event.should_not be_valid
  end

end
