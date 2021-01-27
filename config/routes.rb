Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  namespace :api do
    namespace :v1 do
      resources :users, only: ['create']
      post 'login', to: 'auth#login'
      get 'profile', to: 'profile#index'
      resources :helps, only: ['create', 'index', 'show']
      get 'helps/me', to: 'helps#me'
      resources :categories, only: ['index', 'show']
      get 'categories/:id/helps', to: 'categories#helps'
      resources :chats, only: ['create']
    end
  end
end
