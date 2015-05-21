class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :task_list_id
  # , :priority, :due_date, :description, :completed
end
