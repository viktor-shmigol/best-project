class User < ActiveRecord::Base
  rolify

  has_many :user_boards
  has_many :boards, through: :user_boards

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

  def initials
    full_name.scan(/\b[a-z]/i).join.upcase
  end
end
