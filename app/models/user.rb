class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :female_identification

  has_and_belongs_to_many :roles

  has_many :registrations
  has_many :events, :through => :registrations

  before_save { |u| u.email.downcase! }
  validates_uniqueness_of :email
  validates_presence_of :name

  has_one :user_profile

  def add_role(name)
    self.roles << Role.find_by_name!(name.to_s)
  end

  def role?(name)
    roles.map(&:name).include? name.to_s
  end

  def registered_for?(event)
    registrations.active.map(&:event_id).include? event.id
  end

  def registration_for(event)
    registrations.active.select {|reg| reg.event_id == event.id}.first
  end
end
