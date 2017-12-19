class ApplicationController < ActionController::Base
     # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
  
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        request.env['omniauth.origin'] || root_path
    end

    protected

    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :avatar, :avatar_cache) }
    	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth, :avatar) }
    end
end
