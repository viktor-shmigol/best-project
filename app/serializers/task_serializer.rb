class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :task_list_id, :position
  # , :priority, :due_date, :description, :completed
end
