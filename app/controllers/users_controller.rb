class UsersController < ApplicationController
  def index
    render json: User.by_full_name(params[:term], current_user.id)
  end
end
