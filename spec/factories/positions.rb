# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :position do
    page
    user
    top     10
    left    20
    width   30
    height  40

  end
end
