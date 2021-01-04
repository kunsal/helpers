FactoryBot.define do
  factory :help do
    title { "Help me" }
    description { "his is a better description" }
    association :category
    association :user
    location { "29.0, 120.21" }
  end
end