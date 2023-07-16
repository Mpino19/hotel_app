Rails.application.routes.draw do
  resources :uploads
  root 'home#index'
  devise_for :users
  resources :users
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  resources :profiles, only: [:show, :edit, :update]


  resources :rooms do
    collection do
      get 'search'
      get 'search_result'
    end
  end
end
