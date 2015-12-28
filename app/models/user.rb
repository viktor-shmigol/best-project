class User < ActiveRecord::Base
  include BCrypt
  extend FriendlyId
  rolify
  friendly_id :full_name, use: :slugged

  has_many :user_boards
  has_many :boards, through: :user_boards

  validates :first_name, :last_name, :email, :password, presence: true
  validates :password, confirmation: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  scope :without_user, -> (id) { where.not(id: id) if id }
  scope :by_full_name, lambda  { |query, user_id|
    if query
      where("lower(concat(first_name, ' ', last_name)) LIKE ?", "%#{query.downcase}%")
        .without_user(user_id)
        .limit(10)
        .collect { |user| { id: user.id, text: user.full_name } }
    end
  }

  def full_name
    "#{first_name} #{last_name}"
  end

  def initials
    full_name.scan(/\b[a-z]/i).join.upcase
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate!
    update_attribute(:token, Digest::SHA1.hexdigest([Time.now, self.id, rand].join)[0..16])
    self
  end
end
