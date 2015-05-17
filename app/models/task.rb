class Task < ActiveRecord::Base
  belongs_to :board

  scope :by_board, -> (id) { where(id: id) if id }
end
