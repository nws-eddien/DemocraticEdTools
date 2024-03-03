class Rulebook::RulesController < ApplicationController
  before_action :set_rule, only: [:show, :edit, :update, :destroy]
  def index
    @rules = Rule.ordered
    skip_authorization
  end

  def show
    skip_authorization
  end

  def new
    @rule = Rule.new
    authorize @rule
  end

  def create
    @rule = Rule.new(rule_params)
    authorize @rule
    if @rule.save
      respond_to do |format|
        format.html  { redirect_to rulebook_rules_path, notice: "Rule was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Rule was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @rule
  end

  def update
    authorize @rule
    if @rule.update(rule_params)
      respond_to do |format|
        format.html { redirect_to rulebook_rules_path, notice: "Rule was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Rule was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @rule
    @rule.destroy
    respond_to do |format|
      format.html { redirect_to rulebook_rules_path, notice: 'Regel wurde gelöscht!' }
      format.turbo_stream { flash.now[:notice] = "Regel wurde gelöscht!" }
    end
  end

  private

  def set_rule
    @rule = Rule.find(params[:id])
  end

  def rule_params
    params.require(:rule).permit(:title)
  end
end
