# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :package do
    association :category, :factory => :category
    delivery_date { Date.today + 1.days }
    frequency     { 2 }
    name          { Faker::Name.name  }
    price         { 1 }
  end
end
