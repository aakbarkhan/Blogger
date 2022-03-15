class ApplicationController < ActionController::Base
  # def self.current_user
  #   User.first
  # end
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :bio)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password)
    end
  end
end
