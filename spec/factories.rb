require 'faker'

FactoryGirl.define do
  factory :user do
    firstname Faker::Name.name
    lastname Faker::Name.name
    email Faker::Internet.email
    username Faker::Internet.user_name
    password Faker::Internet.password
  end

  factory :task do
    title Faker::Name.name
    description Faker::Name.name
    due_date Faker::Time.between(2.days.ago, Time.now)
    priority Faker::Number.number(2)
    active "false"
  end
end
