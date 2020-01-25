class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  # before any  action happens, it will authenticate the user
  before_action :authenticate_user!
end
