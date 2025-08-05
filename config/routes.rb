Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Authentication routes
      post 'auth/login', to: 'auth#login'
      post 'auth/signup', to: 'auth#signup'
      post 'business_auth/login', to: 'business_auth#login'
      post 'business_auth/signup', to: 'business_auth#signup'

      # Business routes
      resources :products, only: [:index, :show, :create, :update, :destroy] do
        collection do
          get :search
        end
      end

      # User routes
      resources :orders, only: [:index, :show, :create] do
        member do
          post :cancel
        end
      end
    end
  end
end