class MediaTime::MediaGlobalSettingsController < ApplicationController
  before_action :set_media_global_settings

  def show

  end

  def edit

  end

  def update
    respond_to do |format|
      if @media_global_settings.update(media_global_settings_params)
        format.html { redirect_to media_time_media_global_setting_url(@media_global_settings), notice: "MediaTime was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_media_global_settings
    @media_global_settings = MediaGlobalSetting.first
  end

  def media_global_settings_params
    params.require(:media_global_setting).permit(:daily_time_limit, :behavior_on_exceed, :max_active_users, :penalty_factor)
  end
end
