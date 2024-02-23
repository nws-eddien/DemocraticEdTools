class LayoutsController < ApplicationController
  skip_before_action :authenticate_user!

  def toggle_left_nav_drawer
    skip_authorization
    state = Rails.cache.read("session_#{session.id}_left_nav_drawer") || false
    Rails.cache.write("session_#{session.id}_left_nav_drawer", !state, :expires_in => 5.days)
    respond_to do |format|
      format.turbo_stream
    end
  end



end
