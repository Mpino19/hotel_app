Rails.application.routes.draw do
  root 'home#index'
  get 'home/show'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
