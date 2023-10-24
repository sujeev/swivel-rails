Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      devise_for :users, 
        # path: '',
        path_names: {
          sign_in: 'login',
          sign_out: 'logout',
          registration: 'signup'
        },
        controllers: { 
          sessions: 'api/v1/users/sessions', 
          registrations: 'api/v1/users/registrations' 
        }
      #    resources :classrooms
      #    resources :notifications
      # end

      resources :verticals, only: [:index, :show, :create, :update, :destroy]
      resources :categories, only: [:index, :show, :create, :update, :destroy]
      resources :courses, only: [:index, :show, :create, :update, :destroy]

      get 'search/search'
    end
  end
end
