class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :list_id, :position, :due_date, :description
end
