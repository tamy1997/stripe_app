class ApplicationController < ActionController::Base
	before_action :authenticate_user!
   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :initialize_session
   before_action :load_cart
   
protected

    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:stripe_customer_id])
    end
   

 private
 def initialize_session
   session[:cart] ||= [] # empty cart = empty array
 end
 def load_cart
   # @cart = Product.find(session[:cart])
   # Product.all.pluck(:id) => 1, 2
   # Product.find(1, 2, 3) => error
   # Product.where(id: [1, 2, 3]) => 1, 2
   @cart = Product.where(id: session[:cart])
 end
end
