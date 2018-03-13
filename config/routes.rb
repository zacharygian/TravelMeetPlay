Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :experiences

  resources :events do
    resources :bookings, except: [ :index ] do
    resources :payments, only: [:new, :create]
    get '/denial', to: 'bookings#update_denial'
    patch '/denial', to: 'bookings#update_denial'
     end
    resources :reviews, only: [ :show, :new, :create, :destroy ]

  end

  get '/profile', to: 'pages#profile'
  get '/dashboard', to: 'events#dashboard'
  as :user do
  get 'users', to: 'pages#profile', as: :user_root # Rails 3
end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
