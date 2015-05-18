class Board < ActiveRecord::Base
  has_many :user_boards
  has_many :tasks
  has_many :task_lists

  validates :name, presence: true
end
