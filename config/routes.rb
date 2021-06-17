Rails.application.routes.draw do
  get 'home/index'
  post '/', to: 'home/max_set'
  get 'questions/index', to: 'questions#index'
  post 'question/answer', to: 'questions#answer'
  get 'results/completed', to: 'questions#completed'
  
  resources :histories
  resources :attempts
  resources :questions
  resources :answers

  root :to => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
