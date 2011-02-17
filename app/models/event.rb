class Event < ActiveRecord::Base

  belongs_to :location
  has_many :questions
  
  # TODO allow nested attributes for dynamic creation

  has_many :registrations
  has_many :users, :through => :registrations

  validate :capacity_is_a_positive_number

  def full?
    active_registrations_count >= capacity
  end

  private

  def capacity_is_a_positive_number
    errors.add(:capacity, "must be a positive number") unless capacity.is_a?(Fixnum) && capacity > 0
  end

end
