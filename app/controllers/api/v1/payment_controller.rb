module Api::V1
  class PaymentController < ApplicationController

    skip_before_action :verify_authenticity_token

    # POST /api/v1/payment/pay
    def pay
      card_number = params[:card_number]
      card_exp_month = params[:card_exp_month]
      card_exp_year = params[:card_exp_year]
      card_cvc = params[:card_cvc]

      item = Item.find(params[:item_id].to_i)

      amount = item.price * 1000
      description = "#{item.menu.store.name} #{item.name}"

      response = SimplifyService.charge_by_card(card_number, card_exp_month, card_exp_year, card_cvc, amount, description)
      render text: response.as_json
    end

    private
  end
end
