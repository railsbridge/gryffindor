require 'spec_helper'

describe Answer do
  context "validation" do
    it "should not validate with an empty answer text field" do
      @answer = Factory.build(:answer, :answer_text => nil)
      @answer.should_not be_valid
    end
  end
end
