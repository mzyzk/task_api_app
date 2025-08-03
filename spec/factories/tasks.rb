FactoryBot.define do
  factory :task do
    title { "Test Task" }
    description { "Test Description" }
    due_date { "Date.today" }
    completed { false }
  end
end
