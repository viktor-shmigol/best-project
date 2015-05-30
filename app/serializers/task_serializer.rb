class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :list_id, :position
  # , :priority, :due_date, :description, :completed
end
