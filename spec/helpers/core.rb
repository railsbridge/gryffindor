require 'spec_helper'

module CoreHelper
  def login_as_user
    @user = Factory(:user)
    visit "/"
    fill_in "user_email", :with => @user.email
    fill_in "user_password", :with => @user.password
    click_button "Sign in"
  end
end
