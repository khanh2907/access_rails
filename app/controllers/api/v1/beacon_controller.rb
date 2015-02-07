module Api::V1
  class BeaconController < ApplicationController

    skip_before_action :verify_authenticity_token

    # GET /api/v1/beacon/get
    # take beacon id
    # return menu json
    def get
      beacon = Beacon.find(params[:id].to_i)
      if beacon
        @menu = Menu.find(beacon.menu_id)
        render template: 'api/v1/beacon/get', :layout => false
      else
        head 403
      end
    end

    private
  end
end
