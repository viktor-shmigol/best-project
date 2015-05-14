class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  respond_to :html, :json
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def default_serializer_options
    { root: false }
  end
end
