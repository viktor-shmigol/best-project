class UsersController < ApplicationController
  def index
    render json: User.without_user(current_user.id)
  end
end
