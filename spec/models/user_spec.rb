require 'spec_helper'

describe User do
  # it would be nice if devise provided some shared examples to verify that the modules you're intrested in were included, but their preferred method of testing is pure integration

  describe "saving" do
    it "dowcases the email address" do
      User.create!(:email => "ALLCAPS@EXAMPLE.COM", :password => "password").reload.email.should == "allcaps@example.com"
    end
  end
end
