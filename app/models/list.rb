class List < ActiveRecord::Base
  belongs_to :board
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  acts_as_list scope: :board, add_new_at: :bottom

  scope :by_board, -> (id) { where(board_id: id) if id }

  def target_position=(value)
    insert_at(value.to_i)
  end

  def assigned
    tasks.any?
  end
end
