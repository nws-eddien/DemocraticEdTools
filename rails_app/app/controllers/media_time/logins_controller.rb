class MediaTime::LoginsController < ApplicationController
  before_action :set_media_time, only: [:toggle_login]
  skip_before_action :authenticate_user!, only: [:login_display, :toggle_login]
  def login_display
    skip_authorization
  end
  def toggle_login
    @media_time.toggle_media_session
  end

  private

  def set_media_time
    if params[:id].present? && MediaTime.find(params[:id]).present?
      @media_time = MediaTime.find (params[:id])
      authorize @media_time
    elsif params[:pin].present? && User.find_by_pin(params[:pin]).present?
      @media_time = User.find_by_pin(params[:pin]).media_time || nil
      skip_authorization
    else
      head(401)
    end
  end
end
