class MediaTime::MediaTimesController < ApplicationController
  before_action :set_media_time, only: [:show, :edit, :update]
  include Pundit::Authorization
  def show

  end

  def edit
    authorize @media_time
  end


  def update
    respond_to do |format|
      if @media_time.update(media_time_params)
        format.html { redirect_to media_time_media_time_url(@media_time), notice: "MediaTime was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_media_time
    @media_time = MediaTime.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def media_time_params
    params.require(:media_time).permit(:time_limit)
  end
end
