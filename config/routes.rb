Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users

  devise_for :users#, :controllers => {
#   :registrations => 'users/registrations'
# }

  resources :users do
    get :post_carts #on: :member
  end

  resource :orders

  resources :posts
  resources :post_order
  resources :carts,only:[:show]
  # get 'carts/create' => 'carts#create', as: 'carts'
  post '/post_cart/:id' => 'post_carts#create' , as: 'post_cart'
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  root 'posts#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
