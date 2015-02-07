class BeaconsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_store
  before_action :set_beacon, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def show
    respond_with(@beacon)
  end

  def new
    @beacon = @store.beacons.new
    respond_with(@beacon)
  end

  def edit
  end

  def create
    @beacon = @store.beacons.new(beacon_params)
    if @beacon.save
      flash[:notice] = 'Menu was successfully created.'
    end

    respond_with(@store)
  end

  def update
    if @beacon.update(beacon_params)
      flash[:notice] = 'Menu was successfully updated.'
    end
    respond_with(@store)
  end

  def destroy
    @beacon.destroy
    respond_with(@store)
  end

  private
  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_beacon
    @beacon = Beacon.find(params[:id])
  end

  def beacon_params
    params.require(:beacon).permit(:b_id, :menu_id)
  end

  def activate_param
    params[:activate].to_i
  end
end
