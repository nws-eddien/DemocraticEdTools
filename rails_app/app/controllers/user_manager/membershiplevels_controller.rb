class UserManager::MembershiplevelsController < ApplicationController
  before_action :set_membershiplevel, only: %i[ show edit update destroy ]


  def add_user
    @membershiplevel = Membershiplevel.find(params[:id])
    @user = User.find(params[:user_id])
    @membershiplevel.users << @user
  end

  def remove_user
    @membershiplevel = Membershiplevel.find(params[:id])
    @user = User.find(params[:user_id])
    @membershiplevel.users.delete(@user)
  end
  # GET /user_manager/membershiplevels or /user_manager/membershiplevels.json
  def index
    @membershiplevels = Membershiplevel.all
  end

  # GET /user_manager/membershiplevels/1 or /user_manager/membershiplevels/1.json
  def show
  end

  # GET /user_manager/membershiplevels/new
  def new
    @membershiplevel = Membershiplevel.new
  end

  # GET /user_manager/membershiplevels/1/edit
  def edit
  end

  # POST /user_manager/membershiplevels or /user_manager/membershiplevels.json
  def create
    @membershiplevel = Membershiplevel.new(membershiplevel_params)

    respond_to do |format|
      if @membershiplevel.save
        format.html { redirect_to user_manager_membershiplevel_url(@membershiplevel), notice: "Membershiplevel was successfully created." }
        format.json { render :show, status: :created, location: @membershiplevel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @membershiplevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_manager/membershiplevels/1 or /user_manager/membershiplevels/1.json
  def update
    respond_to do |format|
      if @membershiplevel.update(membershiplevel_params)
        format.html { redirect_to user_manager_membershiplevel_url(@membershiplevel), notice: "Membershiplevel was successfully updated." }
        format.json { render :show, status: :ok, location: @membershiplevel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @membershiplevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_manager/membershiplevels/1 or /user_manager/membershiplevels/1.json
  def destroy
    @membershiplevel.destroy!

    respond_to do |format|
      format.html { redirect_to user_manager_membershiplevels_url, notice: "Membershiplevel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_membershiplevel
    @membershiplevel = Membershiplevel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def membershiplevel_params
    params.require(:membershiplevel).permit(:name)
  end
end

