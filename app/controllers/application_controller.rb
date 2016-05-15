require 'securerandom'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  
  before_action :user_cookies!, :current_user
  
  #get/set user cookie
  def user_cookies!
    cookies[:user] ||= secret_tocken
  end
  
  #get logged in user
  def current_user
    @current_user ||= User.find_or_create_by(secret: cookies[:user])
  end
  
  def secret_tocken
    begin 
      secret = SecureRandom.hex(20)
    end while User.where(secret: secret).last #find unused token
    secret
  end
end
