class UsersController < ApplicationController
  skip_before_action :authorize_user!, only: :create
  before_action :user, only: :create

  def index
    render json: User.by_full_name(params[:term], current_user.id)
  end

  def create
    return render json: @user.authenticate!, status: 200 if @user.update(user_params)
    render json: { status: :error, errors: @user.errors.messages }, status: 422
  end

  def show
    render json: current_user, status: :ok
  end

  def update
    return render json: current_user, status: :ok if current_user.update(user_params)
    render json: { status: :error, errors: current_user.errors.messages }, status: 422
  end

  private

  def user
    @user ||= User.new
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
