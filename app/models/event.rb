class Event < ActiveRecord::Base

  belongs_to :location

  has_many :registrations
  has_many :users, :through => :registrations

  validate :capacity_is_a_positive_number

  private

  def capacity_is_a_positive_number
    errors.add(:capacity, "must be a positive number") unless capacity.is_a?(Fixnum) && capacity > 0
  end

end
