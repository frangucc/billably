# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:order) { |n| n }
  factory :category do
    name { Faker::Name.name }
  end
end
