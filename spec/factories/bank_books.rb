# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bank_book do
    id 1
    name "MyString"
    bank_account "MyText"
    total 1.5
    saldo 1.5
  end
end
