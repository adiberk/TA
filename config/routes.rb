Rails.application.routes.draw do
  devise_for :users

  resources :enrollment_tas
  resources :appointments
  resources :officehours
  resources :chat_rooms
  resources :courses
  resources :enrollments
  resources :users

  root 'users#show'

  mount ActionCable.server => '/cable'

  get 'home/index'
  get '/talist',   to: 'enrollment_tas#talist'
  get '/talist/filter',   to: 'enrollment_tas#talistfilter'
  get '/talist/filter2',   to: 'enrollment_tas#talistfilter2'
  get '/taprofile',   to: 'users#taprofile'
  post '/taprofile',   to: 'users#taprofile'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/confirm_appointment', to: 'appointments#confirm_app'
  post '/unconfirm_appointment', to: 'appointments#unconfirm_app'
  post '/request_appointment', to: 'appointments#request_app'

  get '/ta', to: 'reviews#index'

  delete '/chat_rooms',   to: 'chat_rooms#index'
  # get '/confirm_appointment', to: 'appointments#confirm_app'
end
