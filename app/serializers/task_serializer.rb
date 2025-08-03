class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :completed, :created_at, :updated_at
end
