FactoryGirl.define do
  factory :package do
    customer_cost   { 50 }
    delivery_date   { Date.today + 1.days }
    description     { Faker::Lorem.sentences(2).join ' ' }
    frequency       { 2 }
    name            { Faker::Name.name  }
    our_cost        { 10 }
    images  { [FactoryGirl.create(:image)] }
  end
end
