class User < ActiveRecord::Base
  has_many :user_boards
  has_many :boards, through: :user_boards

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
