Rails.application.routes.draw do
  get 'admins/index'
  get 'admins/show'
  get 'admins/top'
  get 'arrivals/index'
  get 'arrivals/show'
  get 'arrivals/new'
  get 'arrivals/create'
  get 'stocks/create'
  get 'stocks/update'
  get 'labels/create'
  get 'labels/update'
  get 'genres/create'
  get 'genres/update'
  get 'artists/create'
  get 'artists/update'
  get 'songs/create'
  get 'songs/update'
  get 'discs/create'
  get 'discs/update'
  get 'cart_items/index'
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'receipts/show'
  get 'receipts/create'
  get 'addresses/index'
  get 'addresses/new'
  get 'addresses/create'
  get 'addresses/edit'
  get 'addresses/update'
  get 'addresses/destroy'
  get 'products/index'
  get 'products/show'
  get 'products/new'
  get 'products/create'
  get 'products/edit'
  get 'products/update'
  get 'products/destroy'
  get 'users/index'
  get 'users/edit'
  get 'users/update'
  get 'users/show'
  get 'users/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
