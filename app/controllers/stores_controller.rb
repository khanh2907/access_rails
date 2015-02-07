class StoresController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @stores = current_user.stores
    respond_with(@stores)
  end

  def show
    respond_with(@store)
  end

  def new
    @store = current_user.stores.new
    respond_with(@store)
  end

  def edit
  end

  def create
    @store = current_user.stores.new(store_params)
    flash[:notice] = 'Store was successfully created.' if @store.save
    respond_with(@store)
  end

  def update
    flash[:notice] = 'Store was successfully updated.' if @store.update(store_params)
    respond_with(@store)
  end

  def destroy
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
