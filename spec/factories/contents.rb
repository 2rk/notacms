# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :content do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:content) { |n| "content_#{n}" }
    top     10
    left    20
    width   30
    height  40

  end
end
