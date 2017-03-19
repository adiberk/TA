Rails.application.routes.draw do
  # get 'sessions/new'

  get 'home/index'

  resources :courses
  resources :enrollments
  resources :users
  root 'home#index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # get     '/courses',   to: '/courses#new'
  # post    '/courses',   to: '/courses#show'
  # get   '/enrollments',   to: '/enrollments#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
