Factory.define :admin_role, :class => :role do |r|
  r.name 'admin'
end

Factory.define :organizer_role, :class => :role do |r|
  r.name 'organizer'
end
