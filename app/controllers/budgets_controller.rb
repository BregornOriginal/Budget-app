class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /budgets or /budgets.json
  def index
    @budgets = Budget.all
    @groups = Group.all
    @group = Group.find(params[:group_id])
  end

  # GET /budgets/1 or /budgets/1.json
  def show; end

  # GET /budgets/new
  def new
    @group = Group.find(params[:group_id])
    @budget = Budget.new
  end

  # GET /budgets/1/edit
  def edit
    @budget = Group.find(params[:group_id])
  end

  # POST /budgets or /budgets.json
  def create
    @budget = Budget.new(budget_params)
    @budget.author = current_user
    params[:budget][:groups].each do |id|
      @budget.groups.push(Group.find(id)) if id != ''
    end

    respond_to do |format|
      if @budget.save
        format.html { redirect_to groups_path, notice: 'Budget was successfully created.' }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1 or /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to budget_path, notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1 or /budgets/1.json
  def destroy
    @budget = Budget.find(params[:id])
    @group = Group.find_by(id: params[:group_id])
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to group_url(@group), notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_budget
    @budget = Budget.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def budget_params
    params.require(:budget).except(:groups).permit(:name, :amount, :user, :group, :author)
  end
end
