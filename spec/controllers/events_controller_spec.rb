require 'spec_helper'

describe EventsController do
  render_views
  
  before do
    @admin = Factory(:admin)
    sign_in @admin

    @location = Factory(:location)
  end
end
