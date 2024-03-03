class Rulebook::RuleCategoriesController < ApplicationController
  before_action :set_rule_category, only: [:show, :edit, :update, :destroy]
  def index
    @rule_categories = RuleCategory.ordered
    skip_authorization
  end

  def show
    skip_authorization
  end

  def new
    @rule_category = RuleCategory.new
    authorize @rule_category
  end

  def create
    @rule_category = RuleCategory.new(rule_category_params)
    authorize @rule_category
    if @rule_category.save
      respond_to do |format|
        format.html  { redirect_to rulebook_rule_categories_path, notice: "RuleCategory was successfully created." }
        format.turbo_stream { flash.now[:notice] = "RuleCategory was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @rule_category
  end

  def update
    authorize @rule_category
    if @rule_category.update(rule_category_params)
      respond_to do |format|
        format.html { redirect_to rulebook_rule_categories_path, notice: "RuleCategory was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "RuleCategory was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @rule_category
    @rule_category.destroy
    respond_to do |format|
      format.html { redirect_to rulebook_rule_categories_path, notice: 'Regel Kategorie wurde gelöscht!' }
      format.turbo_stream { flash.now[:notice] = "Regel Kategorie wurde gelöscht!" }
    end
  end

  private

  def set_rule_category
    @rule_category = RuleCategory.find(params[:id])
  end

  def rule_category_params
    params.require(:rule_category).permit(:name)
  end
end