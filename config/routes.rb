Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :experiences

  resources :events do
    resources :bookings, except: [ :index ] do
    get '/denial', to: 'bookings#update_denial'
    patch '/denial', to: 'bookings#update_denial'
    put '/denial', to: 'bookings#update_denial'
     end
    resources :reviews, only: [ :show, :new, :create, :destroy ]
  end

  get '/profile', to: 'pages#profile'
  get '/dashboard', to: 'events#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
