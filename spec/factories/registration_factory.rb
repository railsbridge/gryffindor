Factory.define :registration do |f|

  f.association :user, :factory => :user
  f.association :event, :factory => :event

end
