# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    user_id 1
    title "MyString"
    description "MyText"
    abstract "MyText"
    status "MyString"
  end
end
