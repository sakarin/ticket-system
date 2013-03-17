# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip_item do
    booking_id 1
    trip_id "MyString"
    price 1
    seat_number "MyString"
  end
end
