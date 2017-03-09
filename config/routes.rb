Rails.application.routes.draw do
  get 'home/index'

  resources :courses
  resources :enrollments
  resources :users
  root 'home#index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
