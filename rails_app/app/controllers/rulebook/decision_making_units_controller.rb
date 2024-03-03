class Rulebook::DecisionMakingUnitsController < ApplicationController
  before_action :set_decision_making_unit, only: [:show, :edit, :update, :destroy]
  def index
    @decision_making_units = DecisionMakingUnit.ordered
    skip_authorization
  end

  def show
    skip_authorization
  end

  def new
    @decision_making_unit = DecisionMakingUnit.new
    authorize @decision_making_unit
  end

  def create
    @decision_making_unit = DecisionMakingUnit.new(decision_making_unit_params)
    authorize @decision_making_unit
    if @decision_making_unit.save
      respond_to do |format|
        format.html  { redirect_to rulebook_decision_making_units_path, notice: "DecisionMakingUnit was successfully created." }
        format.turbo_stream { flash.now[:notice] = "DecisionMakingUnit was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @decision_making_unit
  end

  def update
    authorize @decision_making_unit
    if @decision_making_unit.update(decision_making_unit_params)
      respond_to do |format|
        format.html { redirect_to rulebook_decision_making_units_path, notice: "DecisionMakingUnit was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "DecisionMakingUnit was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @decision_making_unit
    @decision_making_unit.destroy
    respond_to do |format|
      format.html { redirect_to rulebook_decision_making_units_path, notice: 'Gruppe wurde gelöscht!' }
      format.turbo_stream { flash.now[:notice] = "Gruppe wurde gelöscht!" }
    end
  end

  private

  def set_decision_making_unit
    @decision_making_unit = DecisionMakingUnit.find(params[:id])
  end

  def decision_making_unit_params
    params.require(:decision_making_unit).permit(:name)
  end
end
