class ApplicationController < ActionController::Base
	# before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery with: :null_session


  #----- Can't verify CSRF token authenticity. and ActionController::InvalidAuthenticityToken  this error solve this line  ----
  protect_from_forgery unless: -> { request.format.json? }

  protected

  def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up) do |user|
    	user.permit(:email, :password,:password_confirmation, :remember_me)
  	end
    	devise_parameter_sanitizer.permit(:sign_in) do |user|
      user.permit(:email, :password)
    end
    	devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:email, :password,:password_confirmation, :current_password)
    end
  end

end


