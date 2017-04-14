Rails.application.routes.draw do
  resources :enrollment_tas
  resources :appointments
  resources :officehours
  # get 'sessions/new'

  get 'home/index'

  resources :courses
  resources :enrollments
  resources :users
  root 'home#index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/talist',   to: 'enrollment_tas#talist'
  get '/taprofile',   to: 'users#taprofile'  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/confirm_appointment', to: 'appointments#confirm_app'
  post '/unconfirm_appointment', to: 'appointments#unconfirm_app'
  post '/request_appointment', to: 'appointments#request_app'

  get '/ta', to: 'reviews#index'
  # get '/confirm_appointment', to: 'appointments#confirm_app'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
