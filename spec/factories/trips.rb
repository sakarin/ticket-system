# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip do
    from "MyString"
    to "MyString"
    car_standard "MyString"
    seat 1
    price 1
    departure "2013-03-18 02:44:35"
    arrival "2013-03-18 02:44:35"
    company "MyString"
  end
end
