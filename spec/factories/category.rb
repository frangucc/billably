FactoryGirl.define do
  factory :category do
    name    { Faker::Name.name }
    sequence :order
    image        { FactoryGirl.create(:image) }
  end
end
