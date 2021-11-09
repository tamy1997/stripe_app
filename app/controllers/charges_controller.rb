class ChargesController < ApplicationController
      before_action :authenticate_user!
        skip_before_action :verify_authenticity_token

        def new
            if params[:product_id].present?
               @product = Product.find(params[:product_id])
            end
        end
       
       def create
           @product = Product.find(params[:product_id])
           token = Stripe::Token.create( :card =>{ :number => params[:number],             :exp_month => params[:month], :exp_year => params[:year], :cvc =>             params[:cvc] }, )
           @user = current_user
           unless @user.customer_id.present?
               customer = Stripe::Customer.create(
                    email: @user.email,source: token.id)
               @user.update_attribute("customer_id", customer.id)
           end
          customer = Stripe::Customer.all.retrieve(@user.customer_id)
          begin  
               charge = Stripe::Charge.create(
               customer: current_user.customer_id,
               amount:   @product.price_in_cents,
               currency: 'usd'
           )
               flash[:notice] = 'Card charged successfully.'
         rescue Stripe::CardError => e
               flash[:notice] = 'That card is presently on fire!'
         rescue => e
               flash[:notice] = 'Some error occurred.'
         end
         redirect_to root_path
         rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to @product
         end
end
