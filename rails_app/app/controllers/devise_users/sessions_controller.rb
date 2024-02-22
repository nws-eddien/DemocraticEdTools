# frozen_string_literal: true

class DeviseUsers::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create, :new]

  #GET /resource/sign_in
  def new
    skip_authorization
    super
  end

  #POST /resource/sign_in
  def create
    skip_authorization
    super
  end

  # DELETE /resource/sign_out
  def destroy
    skip_authorization
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
