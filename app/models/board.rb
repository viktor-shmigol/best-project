class Board < ActiveRecord::Base
  has_many :user_boards
  has_many :tasks
  has_many :task_lists, -> { order(position: :asc) }, dependent: :destroy

  validates :name, presence: true
end
