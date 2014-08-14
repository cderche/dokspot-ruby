# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    content "MyString"
    category "MyString"
    product nil
    expiration "2014-08-13"
    published false
  end
end
