Rails.application.routes.draw do
  get 'profiles/edit'
  get 'profiles/update'
  get '/offers', to: 'offers#index'
  get '/sales', to: 'sneakers#sales', as: 'sales'

  devise_for :users
  root to: "sneakers#index"
  get '/sneakers/magazine', to: 'sneakers#magazine', as: :sneaker_magazine
  resources :sneakers, only: [:index, :show, :new, :create, :edit] do
    resources :offers, only: [:new, :create]
  end

  resources :sneakers, only: [:show, :index, :edit, :update] do
    member do
      post :add_to_cart
    end
  end

  resources :cart_items, only: [:create, :destroy]
  get 'cart', to: 'carts#show', as: :cart
  resources :categories
  get '/brands/:brand_name', to: 'sneakers#brand', as: :brand_sneakers

  # Use the custom sign out route you defined
  delete '/users/sign_out', to: 'sessions#destroy', as: :sign_out_user

  # ... Other routes ...
  resource :profile, only: [:edit, :update]
end
