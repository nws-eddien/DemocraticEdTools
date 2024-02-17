class UserManager::MembershiplevelsController < ApplicationController
  before_action :set_group
  before_action :set_membershiplevel, only: [:edit, :update, :destroy]
  before_action :set_new_membershiplevel, only: :new
  before_action :build_membershiplevel_from_params, only: [:create]
  before_action :set_multiselect_data, only: [:edit, :new, :create, :update]
  include Pundit::Authorization
  after_action :verify_authorized

  def new
    authorize @membershiplevel
  end

  def create
    authorize @membershiplevel
    if @membershiplevel.save
      respond_to do |format|
        format.html { redirect_to user_manager_group_path(@group), notice: "Mitgliedschaftslevel erstellt" }
        format.turbo_stream { flash.now[:notice] = "Mitgliedschaftslevel erstellt" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @membershiplevel
  end

  def update
    authorize @membershiplevel
    if @membershiplevel.update(membershiplevel_params)
      respond_to do |format|
        format.html { redirect_to user_manager_group_path(@group), notice: "Mitgliedschaftslevel geändert" }
        format.turbo_stream { flash.now[:notice] = "Mitgliedschaftslevel geändert" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @membershiplevel
      @membershiplevel.destroy
      respond_to do |format|
        format.html { redirect_to user_manager_group_path(@group), notice: "Mitgliedschaftslevel gelöscht" }
        format.turbo_stream { flash.now[:notice] = "Mitgliedschaftslevel gelöscht" }
      end
  end

  private

  def set_new_membershiplevel
    @membershiplevel = @group.membershiplevels.build
  end

  def build_membershiplevel_from_params
    @membershiplevel = @group.membershiplevels.build(membershiplevel_params)
  end
  def set_multiselect_data
    @users = User.all.sort_by { |a| [@membershiplevel.users.include?(a) ? 0 : 1 , a.name]} # Fetch users once
    @multiselect_users_elements_value = @users.map { |u| "membershiplevel_#{@membershiplevel.id}_user_ids_#{u.id}" }.to_json
    @multiselect_users_names_value = @users.map { |u| u.name.titleize }.to_json
    @roles = Role.all.sort_by { |a| [@membershiplevel.roles.include?(a) ? 0 : 1 , a.name]} # Fetch users once
    @multiselect_roles_elements_value = @roles.map { |r| "membershiplevel_#{@membershiplevel.id}_role_ids_#{r.id}" }.to_json
    @multiselect_roles_names_value = @roles.map { |r| r.name.titleize }.to_json
  end
  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_membershiplevel
    @membershiplevel = Membershiplevel.find(params[:id])
  end

  def membershiplevel_params
    params.require(:membershiplevel).permit(:name, :user_ids => [], :role_ids => [])
  end
end
