class Board < ActiveRecord::Base
  extend FriendlyId
  resourcify
  friendly_id :name, use: [:slugged, :finders]

  has_many :user_boards
  has_many :tasks
  has_many :lists, dependent: :destroy
  has_many :members, through: :user_boards, source: :user, class_name: 'User'

  validates :name, presence: true
end
