FactoryGirl.define do
  factory :category do
    name    { Faker::Name.name }
    sequence :order
  end
end
