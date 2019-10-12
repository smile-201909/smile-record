Rails.application.routes.draw do


resources :admins, only: [:index, :show]
get 'admins/top'

resources :arrivals, only: [:index, :show, :new, :create]

resources :stocks, only: [:create, :update]

resources :labels, only: [:create, :update]

resources :genres, only: [:create, :update]

resources :artists, only: [:create, :update]

resources :songs, only: [:create, :update]

resources :discs, only: [:create, :update]

resources :cart_items, only: [:index, :create, :update, :destroy]

resources :receipts, only: [:show, :create]

resources :addresses, only: [:index, :new, :create, :edit, :update, :destroy]

resources :products

resources :users, only: [:index, :edit, :update, :show, :destroy]


devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
