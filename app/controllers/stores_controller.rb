class StoresController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  respond_to :html

  def index
    authorize User
    @stores = current_user.stores
    respond_with(@stores)
  end

  def show
    authorize @store
    respond_with(@store)
  end

  def new
    @store = current_user.stores.new
    authorize @store
    respond_with(@store)
  end

  def edit
    authorize @store
  end

  def create
    @store = current_user.stores.new(store_params)
    authorize @store
    flash[:notice] = 'Store was successfully created.' if @store.save
    respond_with(@store)
  end

  def update
    authorize @store
    flash[:notice] = 'Store was successfully updated.' if @store.update(store_params)
    respond_with(@store)
  end

  def destroy
    authorize @store
    @store.destroy
    respond_with(@store)
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name, :address, :user_id)
    end
end
