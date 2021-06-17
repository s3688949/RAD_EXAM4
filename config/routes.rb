Rails.application.routes.draw do
  get 'home/index'
  get 'questions/index', to: 'questions#index',
  
  resources :histories
  resources :attempts
  resources :questions
  resources :answers

  root :to => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
