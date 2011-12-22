# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    association :merchant, :factory => :merchant
    area      { Faker::Address.city }
    name      { Faker::Name.name }
    zipcode   { '12345' }  
  end
end
