Rails.application.routes.draw do
  resources :histories
  get 'home/index'
  get 'questions/index', to: 'questions#index',
  
  resources :history
  resources :attempts
  resources :questions
  resources :sessions
  resources :database
  resources :answers

  root :to => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
