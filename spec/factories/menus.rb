# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :menu do
    parent_id nil
    content nil
    sequence(:name) { |n| "menu_#{n}" }

  end
end
