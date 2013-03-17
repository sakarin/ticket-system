# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    number "MyString"
    total "MyString"
    pick_up_point "MyString"
    customer_name "MyString"
    customer_telephone "MyString"
    user_id 1
  end
end
