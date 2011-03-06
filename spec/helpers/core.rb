module CoreHelper
  def login_as_user
    visit "/"
    click_link "Sign in"
    @user = Factory(:user)
    fill_in "user_email", :with => @user.email
    fill_in "user_password", :with => @user.password
    click_button "Sign in"
  end

  def wait_until_visible(tries=5)
    tries.times do
      break if yield && yield.visible?
      sleep 1
    end

    yield && yield.should(be_visible)
    yield
  end
end
