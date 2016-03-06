class SessionsController < ApplicationController
  skip_before_action :authorize_user!
  before_filter :find_user

  def create
    return render json: @user.authenticate!, status: :ok if @user && @user.password == params[:password]
    render json: { message: 'Invalid email or password.' }, status: 422
  end

  private

  def find_user
    @user = User.find_by_email(params[:email])
  end
end
