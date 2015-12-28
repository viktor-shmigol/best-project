class ApplicationController < ActionController::Base
  before_action :authorize_user!

  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find_by_token(cookies[:access_token])
  end

  private

  def authorize_user!
    return head(:unauthorized) unless current_user
  end

  def default_serializer_options
    { root: false }
  end
end
