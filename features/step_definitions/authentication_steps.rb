When /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

When /^I am an organizer with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Factory(:organizer, :email => email, :password => password)
end

When /^I am authenticated as an organizer(?: with email "([^"]*)")?$/ do |email|
  email ||= "organizer@example.com"
  Given %|I am an organizer with email "#{email}" and password "password"|
  And %|I go to login|
  And %|I fill in "user_email" with "organizer@example.com"|
  And %|I fill in "user_password" with "password"|
  And %|I press "Sign in"|
end
