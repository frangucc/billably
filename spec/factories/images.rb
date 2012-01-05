include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do
    attachment  { fixture_file_upload(
      "#{Rails.root}/spec/fixtures/billably.png", "image/png") }
  end
end
