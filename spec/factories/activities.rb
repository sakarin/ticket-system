# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    title "MyString"
    publishing_at "2013-05-31"
    body "MyText"
    status false
  end
end
