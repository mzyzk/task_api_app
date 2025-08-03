FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    due_date { "2025-08-03" }
    completed { false }
  end
end
