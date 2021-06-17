Rails.application.routes.draw do
  get 'home/index'
  get 'home/kill'
  get 'questions/index', to: 'questions#index'
  post 'question/answer', to: 'questions#answer'
  get 'question/completed', to: 'questions#completed'
  
  resources :histories
  resources :attempts
  resources :questions
  resources :answers

  root :to => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
