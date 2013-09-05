# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :operation do
    o_date "2013-09-05 17:33:18"
    from_id 1
    amount "9.99"
    o_type "MyString"
    description "MyText"
    user nil
  end
end
