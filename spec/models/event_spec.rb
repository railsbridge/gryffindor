require 'spec_helper'

describe Event do

  it "should validate that capacity is a positive number" do
    event = Factory.build(:event, :capacity => -1)
    event.should_not be_valid

    event.capacity = "foo"
    event.should_not be_valid
  end

  describe "#full?" do

    before do
      @event = Factory(:event, :capacity => 2)
    end

    it "returns false if there are less active registrations than capacity" do
      Factory(:registration, :event => @event)
      @event.should_not be_full
    end

    it "returns true if number of active registrations equals capacity" do
      2.times { Factory(:registration, :event => @event) }    # don't show this to a Pivot
      @event.should be_full
    end

    it "returns true if there are more active registrations than capacity" do
      3.times { Factory(:registration, :event => @event) }
      @event.should be_full
    end
  end

  context "validation" do
    it "should not be valid without questions"
    it "should not be created with empty questions"
  end

end
