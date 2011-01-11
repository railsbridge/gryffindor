class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  before_save { |u| u.email.downcase! }
  
  has_and_belongs_to_many :roles

  def add_role(name)
    self.roles << Role.find_by_name!(name.to_s)
  end

  def role?(name)
    roles.map(&:name).include? name.to_s
  end
end
