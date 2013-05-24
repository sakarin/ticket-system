# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    company_name "MyString"
    adress "MyText"
    tel "MyString"
    fax "MyString"
    user_id 1
  end
end
