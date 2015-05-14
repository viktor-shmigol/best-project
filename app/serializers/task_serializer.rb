class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :priority, :due_date, :description, :completed
end
