Rails.application.routes.draw do
  root 'home#index'
  get 'home/show'
  devise_for :users
  
  resources :users
  devise_scope :users do
    get 'users/profile', to: 'users/profile#show'
    get 'users/profile/edit', to: 'users/profile#edit'
  end

end
