class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :event
end
