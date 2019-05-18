Rails.application.routes.draw do

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  root to: 'top#home'
  get 'about' => 'top#about'

end
