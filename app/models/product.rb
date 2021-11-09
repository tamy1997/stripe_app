class Product < ApplicationRecord
 monetize :price, as: :price_cents


def to_s
   name
 end

 # transform shopping cart products into an array of line items

 def to_builder
  #debugger
   Jbuilder.new do |product|
     product.price stripe_price_id
     product.quantity 1
   end
 end

 after_create do
 	debugger
   product = Stripe::Product.create(name: name)
   price = Stripe::Price.create(product: product, unit_amount: self.price, currency: "usd")
   update(stripe_product_id: product.id, stripe_price_id: price.id )
 end
end
