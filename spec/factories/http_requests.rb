# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :http_request do
    method "MyString"
    parameters "MyString"
    ip_address "MyString"
  end
end
