#docker exec -it dst_rails_dev rails g scaffold_controller user_manager::group name --model-name="Group"
class UserManager::GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /user_manager/groups or /user_manager/groups.json
  def index
    @groups = Group.all
  end

  # GET /user_manager/groups/1 or /user_manager/groups/1.json
  def show
  end

  # GET /user_manager/groups/new
  def new
    @group = Group.new
  end

  # GET /user_manager/groups/1/edit
  def edit
  end

  # POST /user_manager/groups or /user_manager/groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to user_manager_group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_manager/groups/1 or /user_manager/groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to user_manager_group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_manager/groups/1 or /user_manager/groups/1.json
  def destroy
    @group.destroy!

    respond_to do |format|
      format.html { redirect_to user_manager_groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name)
    end
end
