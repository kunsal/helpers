Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: ['create']
      post 'login', to: 'auth#login'
      get 'profile', to: 'profile#index'
      resources :helps, only: ['create', 'index']
      get 'helps/me', to: 'helps#me'
    end
  end
end
