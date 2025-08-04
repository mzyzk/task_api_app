# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  due_date    :date
#  completed   :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :task do
    title { "Test Task" }
    description { "Test Description" }
    due_date { "Date.today" }
    completed { false }
  end
end
