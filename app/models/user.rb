class User < ApplicationRecord
	# Include default devise modules. Others available are:
 # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

 def to_s
   email
 end

 after_create do
 	debugger
   customer = Stripe::Customer.create(email: email)
   update(customer_id: customer.id)
 end
 
end
