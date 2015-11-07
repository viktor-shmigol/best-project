class UserBoard < ActiveRecord::Base
  attr_accessor :role

  belongs_to :user
  belongs_to :board
end
