class HomeController < ApplicationController
  skip_before_action :authorize_user!
end
