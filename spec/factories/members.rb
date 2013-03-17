# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    tat_no "MyString"
    address "MyText"
    website "MyString"
    telephone1 "MyString"
    telephone2 "MyString"
    fax "MyString"
  end
end
