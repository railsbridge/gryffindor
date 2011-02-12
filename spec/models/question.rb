require 'spec_helper'

describe Question do
  context "validation" do
    it "should not validate with an empty question text field" do
      @question = Question.new
      @question.should_not be_valid
    end
  end
end
