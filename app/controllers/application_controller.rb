class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, :if => :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :current_password, :password, :password_confirmation, :first_name, :last_name, :phone, :username, :image, :date_of_birth])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :current_password, :password, :password_confirmation, :first_name, :last_name, :phone, :username, :image, :date_of_birth])
  end
end
