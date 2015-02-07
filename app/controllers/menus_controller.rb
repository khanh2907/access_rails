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
    if @menu.save
      flash[:notice] = 'Menu was successfully created.'
      if activate_param == 1
        @store.update(active_menu_id: @menu.id)
      else
        @store.update(active_menu_id: nil) if @store.active_menu_id == @menu.id
      end
    end

    respond_with(@store)
  end

  def update
    if @menu.update_attributes!(menu_params)
      flash[:notice] = 'Menu was successfully updated.'

      if activate_param == 1
        @store.update(active_menu_id: @menu.id)
      else
        @store.update(active_menu_id: nil) if @store.active_menu_id == @menu.id
      end
    end
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
    params.require(:menu).permit(:name, :description, :items_attributes => [:name, :description, :price, :id, :_destroy])
  end

  def activate_param
    params[:activate].to_i
  end
end
