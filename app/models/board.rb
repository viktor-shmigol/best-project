class Board < ActiveRecord::Base
  has_many :user_boards
  has_many :tasks

  validates :name, presence: true
end
