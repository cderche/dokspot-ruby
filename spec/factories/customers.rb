# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    full_name "MyString"
    company "MyString"
    address1 "MyString"
    address2 "MyString"
    postcode "MyString"
    city "MyString"
    country "MyString"
    notes "MyText"
    telephone "MyString"
    email "MyString"
  end
end
