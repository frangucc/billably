FactoryGirl.define do
  factory :package do
    delivery_date { Date.today + 1.days }
    frequency     { 2 }
    name          { Faker::Name.name  }
    price         { 1 }
  end
end
