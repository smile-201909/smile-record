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

  resources :users, only: [:index, :edit, :update, :show, :destroy, :create]
      resources :receipts, only: [:show, :create]

  resources :products



get "search" => "products#search"



  resources :labels, only: [:new, :create, :update] #namespace:admin do の中に入れる

  resources :genres, only: [:new, :create, :update] #namespace:admin do の中に入れる

  resources :artists, only: [:new, :create, :update] #namespace:admin do の中に入れる


  resources :addresses, only: [:index, :new, :create, :edit, :update, :destroy]


  resources :products do
    resources :stocks, only: [:create, :update] do
      resources :arrivals, only: [:index, :show, :new, :create]
    end
    resources :discs, only: [:create, :update]
    resources :songs, only: [:create, :update]
  end

  resources :users, only: [:index, :edit, :update, :show, :destroy, :create]

  resources :carts, only: [:index, :create, :update, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
