Factory.define :user do |u|
  u.name 'Sample User'
  u.email {Factory.next(:email)}
  u.password { "password" }
  u.password_confirmation { "password" }
end

Factory.define :organizer, :parent => :user do |organizer|
  organizer.roles {|a| [a.association(:organizer_role)] }
end

Factory.define :admin, :parent => :user do |admin|
  admin.roles {|a| [a.association(:admin_role)] }
end

Factory.sequence :email do |n|
  "email#{n}@example.com"
end
