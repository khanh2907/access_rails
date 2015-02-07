module Api::V1
  class PaymentController < ApplicationController

    skip_before_action :verify_authenticity_token

    # POST /api/v1/payment/pay
    def pay
      store_id = params[:store_id].to_i
      payer_id = params[:user_id].to_i
      card_number = params[:card_number]
      card_exp_month = params[:card_exp_month]
      card_exp_year = params[:card_exp_year]
      card_cvc = params[:card_cvc]

      store = Store.find(store_id)
      item = Item.find(params[:item_id].to_i)

      amount = item.price * 1000
      description = "#{item.menu.store.name} #{item.name}"
      payment_time = Time.current
      response = SimplifyService.charge_by_card(card_number, card_exp_month, card_exp_year, card_cvc, amount, description)

      # save a record of the transaction
      store.transaction_histories.create(payer_id: payer_id,
                                         item_id: item.id,
                                         amount: amount,
                                         payment_time: payment_time,
                                         cc_number:card_number.split(//).last(4).join)

      render text: response.as_json
    end

    private
  end
end
