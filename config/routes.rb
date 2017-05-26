Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :stores do
  	resources :products
  end
end
