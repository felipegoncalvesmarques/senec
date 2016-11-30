# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-13 19:11:26
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-14 21:11:87

class Partners::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session
  before_action :configure_sign_up_params, only: [:create]
  before_action :authenticate_organizer!, only: [:new, :create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @companies = Company.where(esta_ativo: true)
    super
  end

  # POST /resource
  def create
    super
    sign_out
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    current_partner.update(esta_ativo: false)
    sign_out
  end

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
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :telefone, :company_id, :email, :password])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :telefone, :company_id, :email, :password])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #  '/partners/sign_up'
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
