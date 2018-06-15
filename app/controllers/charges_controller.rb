class ChargesController < ApplicationController

    def new
    puts "key: #{ Rails.configuration.stripe[:publishable_key] }"
        @stripe_btn_data = {
          key: "#{ Rails.configuration.stripe[:publishable_key] }",
          description: "BigMoney Membership - #{current_user.name}",
          amount: 500
        }
      end
    
    def create
      # Amount in cents
      @amount = 500
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end