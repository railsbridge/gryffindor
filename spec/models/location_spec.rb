require 'spec_helper'

describe Location do
  before do
    @location = Factory(:location)
  end

  it 'has an address and notes' do
    @location.address.should_not be_blank
    @location.notes.should_not be_blank
  end
end
