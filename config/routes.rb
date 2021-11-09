Rails.application.routes.draw do
 devise_for :users
 resources :products
 #resources  :checkouts
 root 'products#index'
  post "checkouts/create", to: "checkouts#create"
 resources :webhooks, only: [:create]
 get "success", to: "checkouts#success"
 get "cancel", to: "checkouts#cancel"

 post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
 delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
 #root 'homes#index'
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end