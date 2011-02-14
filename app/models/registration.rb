class Registration < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :user_id, :scope => :event_id, :message => "User has already registered for this event"

end
