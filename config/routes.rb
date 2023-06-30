Rails.application.routes.draw do
  root 'home#index'
  get 'home/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users
  devise_scope :users do
    get 'users/:id/profile', to: 'users/profile#show'
    get 'users/:id/profile/edit', to: 'users/profile#edit'
  end

end
