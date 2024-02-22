class UserManager::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :pin_generator, :generate_pin]
  include Pundit::Authorization
  after_action :verify_authorized

  def index
    @users = User.ordered
    skip_authorization
  end

  def show
    skip_authorization
    @membershiplevels = @user.membershiplevels.ordered
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      respond_to do |format|
        format.html  { redirect_to user_manager_users_path, notice: "User was successfully created." }
        format.turbo_stream { flash.now[:notice] = "User was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @user
  end

  def pin_generator
    authorize @user
    @pin = @user.generate_pin
  end

  def generate_pin
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_manager_pin_generator_url(@user), notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @user
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to user_manager_users_path, notice: "User was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "User was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_manager_users_path, notice: 'User wurde gelöscht!' }
      format.turbo_stream { flash.now[:notice] = "User wurde gelöscht!" }
    end
  end

  private

  def set_user

    @user = User.find(params[:id])
  end

  def user_params
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    params.require(:user).permit(:name, :avatar, :password, :password_confirmation, :pin, :easy_pin, :pin_length)
  end
end
