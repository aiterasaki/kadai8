Rails.application.routes.draw do
  # get 'users/index'

  # get 'users/:id' => 'users#show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :posts 
  # do
  # 	resources :product_images
  # end
  resources :users
  root 'posts#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
