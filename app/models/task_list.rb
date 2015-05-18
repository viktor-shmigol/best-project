class TaskList < ActiveRecord::Base
  belongs_to :board
  has_many :tasks, -> { order "position" }, dependent: :destroy

  validates :name, presence: true

  scope :by_board, -> (id) { where(board_id: id) if id }

  def target_position=(value)
    insert_at(value.to_i)
  end
end
