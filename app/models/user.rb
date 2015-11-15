class User < ActiveRecord::Base
  rolify

  has_many :user_boards
  has_many :boards, through: :user_boards

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :without_user, -> (id) { where.not(id: id) if id }
  scope :by_full_name, -> (query, user_id) {
    if query
      where("lower(concat(first_name, ' ', last_name)) LIKE ?", "%#{query.downcase}%")
      .without_user(user_id)
      .limit(10)
      .collect{ |user| { id: user.id, text: user.full_name } }
    end
  }

  def full_name
    "#{first_name} #{last_name}"
  end

  def initials
    full_name.scan(/\b[a-z]/i).join.upcase
  end
end
