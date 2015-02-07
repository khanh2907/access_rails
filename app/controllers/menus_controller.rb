class MenusController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_store
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def show
    respond_with(@menu)
  end

  def new
    @menu = @store.menus.new
    @menu.items.build
    respond_with(@menu)
  end

  def edit
  end

  def create
    @menu = @store.menus.new(menu_params)
    flash[:notice] = 'Store was successfully created.' if @store.save
    respond_with(@store)
  end

  def update
    flash[:notice] = 'Store was successfully updated.' if @store.update(store_params)
    respond_with(@store)
  end

  def destroy
    @menu.destroy
    respond_with(@store)
  end

  private
  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :description, :items_attributes => [:name, :description, :price])
  end
end
