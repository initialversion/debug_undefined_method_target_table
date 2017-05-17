class ApplicationController < ActionController::Base
  before_action :authenticate_designer!

  protect_from_forgery with: :exception
end
