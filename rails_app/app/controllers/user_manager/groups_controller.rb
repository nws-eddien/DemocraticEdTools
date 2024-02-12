class UserManager::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.ordered
  end

  def show
    @membershiplevels = @group.membershiplevels.ordered
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      respond_to do |format|
        format.html  { redirect_to user_manager_groups_path, notice: "Group was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Group was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      respond_to do |format|
        format.html { redirect_to user_manager_groups_path, notice: "Group was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Group was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to user_manager_groups_path, notice: 'Gruppe wurde gelöscht!' }
      format.turbo_stream { flash.now[:notice] = "Gruppe wurde gelöscht!" }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end