Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    get 'dashboard/users', to: 'dashboard#users', as: 'dashboard_users'
    get 'dashboard/links', to: 'dashboard#links', as: 'link_lists'
    get 'dashboard/guest_users', to: 'dashboard#guest_users', as: 'dashboard_guest_users'
  end
  
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :links
  resources :views, path: :v, only: [:show]
  resources :profiles, path: :p, only: [:show]
  root "links#index"
end
