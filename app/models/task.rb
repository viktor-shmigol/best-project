class Task < ActiveRecord::Base
  belongs_to :task_list
  belongs_to :boar

  acts_as_list scope: :task_list, add_new_at: :top

  scope :by_board, -> (id) { where(id: id) if id }
end
