Factory.define :user do |u|
  u.email {Factory.next(:email)}
  u.password { "password" }
  u.password_confirmation { "password" }
end

Factory.define :organizer, :parent => :user do |a|
end

Factory.sequence :email do |n|
  "email#{n}@example.com"
end
