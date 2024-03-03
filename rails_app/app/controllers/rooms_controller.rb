class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  def index
    @rooms = Room.ordered
    skip_authorization
  end

  def show
    skip_authorization
  end

  def new
    @room = Room.new
    authorize @room
  end

  def create
    @room = Room.new(room_params)
    authorize @room
    if @room.save
      respond_to do |format|
        format.html  { redirect_to rooms_path, notice: "Room was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Room was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @room
  end

  def update
    authorize @room
    if @room.update(room_params)
      respond_to do |format|
        format.html { redirect_to rooms_path, notice: "Room was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Room was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @room
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_path, notice: 'Raum wurde gelöscht!' }
      format.turbo_stream { flash.now[:notice] = "Raum wurde gelöscht!" }
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end