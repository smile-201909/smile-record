class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Administrator
      administrators_path
    when User
      root_path
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :configure_permitted_parameters, if: :devise_controller?

  #
  # protected
  #
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, addresses_attributes: [:post, :a_address, :phone, :pulldown_name]] )
  end

end
