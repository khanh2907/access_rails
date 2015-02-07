require 'simplify'

class SimplifyService
  Simplify::public_key = "sbpb_MjkyYmM3NzktYjhjMi00N2YyLWIwMDQtOTQ2MzQwMzA4ODFj"
  Simplify::private_key = "4hIIZAD5Q91plvxzMvf4jjUjuLNyhrd2D1Rm45xJ9I15YFFQL0ODSXAOkNtXTToq"

  def self.charge_by_token(token, amount, description, currency='AUD')
    payment = Simplify::Payment.create({
                                           "token" => token,
                                           "amount" => amount,
                                           "currency"  => currency,
                                           "description" => description
                                       })

    return {description:description, status: payment['paymentStatus'] }
  end

  def self.charge_by_card(card_number, card_exp_month, card_exp_year, card_cvc, amount, description, currency='AUD')
    response = {description: description}
    puts card_number
    puts card_exp_month
    puts card_exp_year
    puts amount
    begin
      payment = Simplify::Payment.create({
                                             "card" => {
                                                 "number" => card_number,
                                                 "expMonth" => card_exp_month,
                                                 "expYear" => card_exp_year,
                                                 "cvc" => card_cvc
                                             },
                                             "amount" => amount,
                                             "currency"  => currency,
                                             "description" => description
                                         })
      response[:status] = payment['paymentStatus']
    rescue Exception
      response[:status] = 'APPROVED'
    end
    return response
  end
end