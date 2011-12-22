FactoryGirl.define do
 factory :user do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    password    '123123'
    email       { "#{first_name}.#{last_name}@billably.com".downcase }
    zipcode     { '12345-6789' }
  end
end
