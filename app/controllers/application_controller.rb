class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Administrator
      administrators_path
    when User
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Administrator
      new_administrator_session_path
    when User
      new_user_session_path
    end
  end
  # before_action :configure_permitted_parameters, if: :devise_controller?
  #
  # protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
end
