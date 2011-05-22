Factory.define :user do |user|
  user.name                  "Zack Yeah"
  user.email                 "zack@yeah.com"
  user.password              "qwerty"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :name do |n|
  "Person #{n}"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end