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

  resources :users, only: [:index, :edit, :update, :show, :destroy, :create] do
    resources :receipts, only: [:show, :create]
  end

  resources :products



get "search" => "products#search"



  resources :labels, only: [:new, :create, :update] #namespace:admin do の中に入れる

  resources :genres, only: [:new, :create, :update] #namespace:admin do の中に入れる

  resources :artists, only: [:new, :create, :update] #namespace:admin do の中に入れる


  resources :addresses, only: [:index, :new, :create, :edit, :update, :destroy]


  resources :products do
    resources :discs, only: [:create, :update]
    resources :songs, only: [:create, :update]
  end


#開発の便宜上、一旦ネストを外す　ここから

  resources :stocks, only: [:create, :update]
  resources :arrivals, only: [:index, :show, :new, :create]


#開発の便宜上、一旦ネストを外す　ここまで



  resources :users, only: [:index, :edit, :update, :show, :destroy, :create]

  resources :carts, only: [:index, :create, :update, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
