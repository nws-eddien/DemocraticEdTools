class UserManager::AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update]
  include Pundit::Authorization
  after_action :verify_authorized

  def index
    @apps = App.ordered
    skip_authorization
  end

  def show
    skip_authorization
    @roles = @app.roles.ordered
  end

  def new
    @app = App.new
    authorize @app
  end

  def edit
    authorize @app
  end

  def update
    authorize @app
    if @app.update(app_params)
      respond_to do |format|
        format.html { redirect_to user_manager_apps_path, notice: "App was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "App was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_app
    @app = App.find(params[:id])
  end

  def app_params
    params.require(:app).permit(:name, :active)
  end
end
