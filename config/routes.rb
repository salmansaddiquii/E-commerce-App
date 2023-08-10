Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations' 
  }

  devise_scope :user do
    authenticated :user do
      root to: 'homes#index', as: :authenticated_root
    end
    unauthenticated do
      root to: 'users/sessions#new', as: :unauthenticated_root
    end
  end

  resources :products
  resources :categories
  resource :cart, only: [:show] do
    post 'cart_item/:product_id', to: 'carts#cart_item', as: :add_to
  end
end
