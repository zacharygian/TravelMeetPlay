Rails.application.routes.draw do

  devise_for :users
  root to: 'events#index'

  resources :experiences

  resources :events do
    resources :bookings, except: [ :index ]
    resources :reviews, only: [ :show, :new, :create, :destroy ]
  end

  get '/profile', to: 'pages#profile'
  get '/dashboard', to: 'events#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
