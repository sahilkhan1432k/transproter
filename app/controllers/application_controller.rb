class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?



    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :licence_number, :birthday, :address, :user_type, :email, :password, :remember_me, :avatar])
        devise_parameter_sanitizer.permit(:sign_in, keys: [ :email, :password, :remember_me])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :licence_number, :age, :address, :user_type, :email, :password, :current_password, :remember_me, :avatar])

    end

end
