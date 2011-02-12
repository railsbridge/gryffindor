require 'spec_helper'

describe Answer do
  context "validation" do
    it "should not validate with an empty answer text field" do
      @answer = Answer.new
      @answer.should_not be_valid
    end
  end
end
