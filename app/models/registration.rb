class Registration < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  belongs_to :inviter, :class_name => 'User', :foreign_key => :inviter_id

  has_many :answers
  accepts_nested_attributes_for :answers

  scope :attending, :conditions => ["withdrawn_at IS NULL AND waitlisted = ?", false]
  scope :active, :conditions => ["withdrawn_at IS NULL", false]
  scope :withdrawn, :conditions => ["withdrawn_at IS NOT NULL"]
  scope :waitlisted, :conditions => ["withdrawn_at IS NULL AND waitlisted = ?", true]

  validate :validate_uniqueness_of_active_registration

  before_create :sets_waitlisted
  after_save :update_event_active_registrations_count

  def withdrawn?
    !!withdrawn_at
  end

  def withdraw!
    self.withdrawn_at = Time.now
    self.save
  end

  private

  def validate_uniqueness_of_active_registration
    if new_record?
      errors.add(:user_id, "has already registered for this event") if Registration.exists?(["user_id = ? AND event_id = ? AND withdrawn_at IS NULL", user_id, event_id])
    end
  end

  def sets_waitlisted
    self[:waitlisted] = event.full?
    true
  end

  def update_event_active_registrations_count
    event.active_registrations_count = event.registrations.active.count
    event.save
  end
end
