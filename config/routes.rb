Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :articles #,only: [:show, :index, :new, :create, :edit, :update, :destroy]
   resources :comments
end
