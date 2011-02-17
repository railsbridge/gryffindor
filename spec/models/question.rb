require 'spec_helper'

describe Question do
  context "validation" do
    it "should not validate with an empty question text field" do
      @question = Factory.build(:question, :question_text => nil)
      @question.should_not be_valid
    end
  end
end
