Rails.application.routes.draw do
  get 'home/index'

  resources :courses
  resources :enrollments
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
