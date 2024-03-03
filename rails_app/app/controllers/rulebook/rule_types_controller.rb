class Rulebook::RuleTypesController < ApplicationController
  before_action :set_rule_type, only: [:show, :edit, :update, :destroy]
  def index
    @rule_types = RuleType.ordered
    skip_authorization
  end

  def show
    skip_authorization
  end

  def new
    @rule_type = RuleType.new
    authorize @rule_type
  end

  def create
    @rule_type = RuleType.new(rule_type_params)
    authorize @rule_type
    if @rule_type.save
      respond_to do |format|
        format.html  { redirect_to rulebook_rule_types_path, notice: "RuleType was successfully created." }
        format.turbo_stream { flash.now[:notice] = "RuleType was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @rule_type
  end

  def update
    authorize @rule_type
    if @rule_type.update(rule_type_params)
      respond_to do |format|
        format.html { redirect_to rulebook_rule_types_path, notice: "RuleType was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "RuleType was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @rule_type
    @rule_type.destroy
    respond_to do |format|
      format.html { redirect_to rulebook_rule_types_path, notice: 'RegelTyp wurde gelöscht!' }
      format.turbo_stream { flash.now[:notice] = "RegelTyp wurde gelöscht!" }
    end
  end

  private

  def set_rule_type
    @rule_type = RuleType.find(params[:id])
  end

  def rule_type_params
    params.require(:rule_type).permit(:name)
  end
end
