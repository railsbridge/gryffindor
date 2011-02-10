class Event < ActiveRecord::Base

  belongs_to :location

  has_many :registrations
  has_many :users, :through => :registrations

end
