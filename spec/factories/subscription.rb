FactoryGirl.define do
  factory :subscription do
    association :merchant, :factory => :merchant
    area          { Faker::Address.city }
    categories    { FactoryGirl.build_list :category, 3}
    description   { Faker::Lorem.sentences(2).join ' ' }
    name          { Faker::Name.name }
    zipcode       { '12345' }
  end
end
