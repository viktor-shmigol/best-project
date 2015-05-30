class Task < ActiveRecord::Base
  belongs_to :list
  belongs_to :board

  acts_as_list scope: :list, add_new_at: :bottom

  scope :by_board, -> (id) { where(board_id: id) if id }

  def target_position=(value)
    insert_at(value.to_i)
  end
end
