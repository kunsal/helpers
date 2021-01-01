FactoryBot.define do
  factory :help do
    title { "Help me" }
    description { "his is a better description" }
    category_id { 1 }
    user_id { 1 }
    location { "29.0, 120.21" }
  end
end