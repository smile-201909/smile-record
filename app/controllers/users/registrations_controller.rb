# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   #before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
     # @user = User.new
     # # @address = @user.build_address
     # @address = @user.addresses.build
  # end

  def create
    p "aaaa"
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)

        address = Address.new
        address.user_id = current_user.id
        address.post = params[:post]
        address.a_address = params[:a_address]
        address.phone = params[:phone]
        address.family_name = current_user.family_name
        address.first_name = current_user.first_name
        address.family_name_kana = current_user.family_name_kana
        address.first_name_kana = current_user.first_name_kana
        address.pulldown_name = params[:pulldown_name]
        address.save

        cart = Cart.new
        cart.user_id = current_user.id
        cart.save

        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # POST /resource
  # def create
  #   super
  #   user = User.new(configure_sign_up_params)
  #   user.save!
  #   user.addresses.first.family_name = current_user.family_name
  #   user.addresses.first.first_name = current_user.first_name
  #   user.addresses.first.family_name_kana = current_user.family_name_kana
  #   user.addresses.first.first_name_kana = current_user.first_name_kana
  #   address.save
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end
  # def destroy
  #   # userモデルのleaveメソッド
  #   resource.leave
  #   Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
  #   set_flash_message(:notice, :destroyed)
  #   yield resource if block_given?
  #   respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, addresses_attributes: [:post, :a_address, :phone, :pulldown_name]] )
  # end

end
