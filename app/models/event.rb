class Event < ActiveRecord::Base

  belongs_to :location
  
  has_many :questions
  accepts_nested_attributes_for :questions
  
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

  def completeness_of_questions
    errors.add(:base, "questions must be complete") unless valid_questions
  end

  def valid_questions
    self.questions.all? do |question|
      question.is_valid?
    end
  end

end
