# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :merchant do
    email { Faker::Internet.email }
    name  { Faker::Internet.user_name }
    zipcode { '12345' }
  end
end
