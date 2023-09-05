Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }

  resources :products, only: [:index, :show, :create]
  resources :carts, only: [:show, :update]
  
  post 'carts/add_item', to: 'carts#add_item'
  delete 'carts/remove_item', to: 'carts#remove_item'


  # namespace :admin do
  #   resources :products
  # end
  namespace :admin do
    resources :products, only: [:new, :create]
  end
  
  
end
