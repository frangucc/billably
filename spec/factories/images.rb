include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do
    association :merchant, :factory => :merchant
    association :package, :factory => :package
    attachment  { fixture_file_upload(
      "#{Rails.root}/spec/fixtures/billably.png", "image/png") }
  end
end
