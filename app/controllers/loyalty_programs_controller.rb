class LoyaltyProgramsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_store
  before_action :set_loyalty_program, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def show
    respond_with(@loyalty_program)
  end

  def new
    @loyalty_program = @store.loyalty_programs.new
    @loyalty_program.s_type = 0
    respond_with(@loyalty_program)
  end

  def edit
  end

  def create
    @loyalty_program = @store.loyalty_programs.new(loyalty_program_params)
    if @loyalty_program.save
      flash[:notice] = 'Menu was successfully created.'
    end

    respond_with(@store)
  end

  def update
    if @loyalty_program.update(loyalty_program_params)
      flash[:notice] = 'Menu was successfully updated.'
    end
    respond_with(@store)
  end

  def destroy
    @loyalty_program.destroy
    respond_with(@store)
  end

  private
  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_loyalty_program
    @loyalty_program = LoyaltyProgram.find(params[:id])
  end

  def loyalty_program_params
    loyalty_program_params = params.require(:loyalty_program).permit(:s_type, :s_id, :s_required, :s_discount, :start_date, :end_date)
    loyalty_program_params[:s_type] = loyalty_program_params[:s_type].to_i
    return loyalty_program_params
  end
end
