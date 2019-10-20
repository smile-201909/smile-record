Rails.application.routes.draw do
  namespace :administrators do
    resources :users, only: [:index, :edit, :update, :show, :destroy, :create] do
      resources :addresses, only: [:index, :new, :create, :edit, :update, :destroy]
    end
    resources :products do
      resources :discs, only: [:create, :update]
      resources :songs, only: [:create, :update]
    end
    resources :labels, only: [:new, :create, :update]
    resources :genres, only: [:new, :create, :update]
    resources :artists, only: [:new, :create, :update]
  end
  get 'administrators/top' => 'administrators#top', as: "administrators_top"
  # resources :administrators
  # get 'administrators' => 'administrators#top', as: 'administrators'
  # get 'administrators/users/:id' => 'administrators#show', as: 'administrators_user_main'
  # get 'administrators/users/:id/edit' => 'administrators#edit', as: 'edit_administrators_user_main'
  # patch 'administrators/users/:id' => 'administrators#update', as: 'update_administrators_user_main'
  # put 'administrators/users/:id' => 'administrators#update'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  # get 'administrators/show'
  # get 'administrators/edit'
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
  get 'thanks/index'
  get 'admins/top'

  resources :users, only: [:index, :edit, :update, :show, :destroy, :create] do
    resources :addresses, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  end
      resources :receipts, only: [:show, :create]

  resources :products



get "search" => "products#search"

  resources :products do
    resources :discs, only: [:create, :update]
    resources :songs, only: [:create, :update]
  end


#開発の便宜上、一旦ネストを外す　ここから

  resources :stocks, only: [:create, :update]
  resources :arrivals, only: [:index, :show, :new, :create]


#開発の便宜上、一旦ネストを外す　ここまで



  resources :users, only: [:index, :edit, :update, :show, :destroy, :create] do
    resources :addresses, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :carts, only: [:index, :create, :update, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
