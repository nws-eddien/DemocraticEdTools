class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_current_app
  def set_current_app
    @current_app = self.class.to_s.split("::").first
  end
end
