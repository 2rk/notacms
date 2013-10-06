# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :position do
    content
    user
    top     100
    left    200
    width   300
    height  400

  end
end
