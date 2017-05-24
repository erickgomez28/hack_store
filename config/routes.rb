Rails.application.routes.draw do
  get 'products/index'

  get 'products/edit'

  get 'products/new'

  get 'products/show'

  get 'stores/index'

  get 'stores/new'

  get 'stores/create'

  get 'stores/show'

  get 'stores/edit'

  get 'stores/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stores do 
  	resources :products
  end
end
