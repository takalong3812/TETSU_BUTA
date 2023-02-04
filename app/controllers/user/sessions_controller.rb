# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
def guest_log_in
  @user= User.guest
  sign_in user
  redirect_to user_user_path(@user), notice: 'logged in as a guest'
end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  protected
  
 def user_state
   @use= User.find_by(email: params[:user][:email])
   return if !@user
   if @user.valid_password?(params[:user][:password]) && @user.is_deteted
   redirect_to new_user_regitsration_path
   end
 end




  
end
