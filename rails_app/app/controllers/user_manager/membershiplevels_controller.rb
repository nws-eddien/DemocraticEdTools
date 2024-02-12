class UserManager::MembershiplevelsController < ApplicationController
  before_action :set_group
  before_action :set_membershiplevel, only: [:edit, :update, :destroy]

  def new
    @membershiplevel = @group.membershiplevels.build
  end

  def create
    @membershiplevel = @group.membershiplevels.build(membershiplevel_params)
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
  end

  def update
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
      @membershiplevel.destroy
      redirect_to user_manager_group_path(@group), notice: "Mitgliedschaftslevel gelöscht"
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_membershiplevel
    @membershiplevel = Membershiplevel.find(params[:id])
  end

  def membershiplevel_params
    params.require(:membershiplevel).permit(:name)
  end
end
