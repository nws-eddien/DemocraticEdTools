class UserManager::RolesController < ApplicationController
  before_action :set_app
  before_action :set_role, only: [:edit, :update, :destroy]
  before_action :set_new_role, only: :new
  before_action :build_role_from_params, only: [:create]
  before_action :set_multiselect_data, only: [:edit, :new, :create, :update]
  include Pundit::Authorization
  after_action :verify_authorized

  def new
    authorize @role
  end

  def create
    authorize @role
    if @role.save
      respond_to do |format|
        format.html { redirect_to user_manager_app_path(@app), notice: "Rolle erstellt" }
        format.turbo_stream { flash.now[:notice] = "Rolle erstellt" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @role
  end

  def update
    authorize @role
    if @role.update(role_params)
      respond_to do |format|
        format.html { redirect_to user_manager_app_path(@app), notice: "Rolle geändert" }
        format.turbo_stream { flash.now[:notice] = "Rolle geändert" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @role
    @role.destroy
    respond_to do |format|
      format.html { redirect_to user_manager_app_path(@app), notice: "Rolle gelöscht" }
      format.turbo_stream { flash.now[:notice] = "Rolle gelöscht" }
    end
  end

  private

  def set_new_role
    @role = @app.roles.build
  end

  def build_role_from_params
    @role = @app.roles.build(role_params)
  end
  def set_multiselect_data
    @permissions = @app.permissions.ordered# Fetch users once
    @multiselect_permissions_elements_value = @permissions.map { |r| "role_#{@role.id}_permission_ids_#{r.id}" }.to_json
    @multiselect_permissions_names_value = @permissions.map { |r| r.name.titleize }.to_json
  end

  def set_app
    @app = App.find(params[:app_id])
  end

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :permission_ids => [])
  end
end
