Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'administrators/index'
  get 'administrators/show'
  get 'administrators/edit'
  root 'products#index'
  devise_for :administrators, controllers: {
    sessions:      'administrators/sessions',
    passwords:     'administrators/passwords',
    registrations: 'administrators/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  get 'administrators' => 'administrators#index', as: 'administrators'
  get 'thanks/index'
  get 'admins/top'
  resources :products

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


  resources :users, only: [:index, :edit, :update, :show, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
