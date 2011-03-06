# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rubygems'
require 'capybara/rails'
require 'capybara/dsl'
require 'factory_girl_rails'
require 'selenium-webdriver'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
Dir[Rails.root.join("spec/helpers/**/*.rb")].each {|f| require f}

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_selector = :css
  config.app_host = "localhost:4000"
  config.server_port = 4000
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.include(Capybara, :type => :integration)
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # config.use_transactional_fixtures = false
  config.before :each do
    ActiveRecord::Base.send(:descendants).each do |klass|
      klass.destroy_all if klass
    end
  end
end
