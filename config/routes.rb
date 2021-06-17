Rails.application.routes.draw do
  get 'question/new'
  get 'question/create'
  get 'question/destroy'
  get 'question/edit'
  get 'history/new'
  get 'history/create'
  get 'history/destroy'
  get 'history/edit'
  get 'database/new'
  get 'database/create'
  get 'database/destroy'
  get 'database/edit'
  get 'attempt/new'
  get 'attempt/create'
  get 'attempt/destroy'
  get 'attempt/edit'
  get 'answer/new'
  get 'answer/create'
  get 'answer/destroy'
  get 'answer/edit'
  get 'home/index'
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  
  resources :history
  resources :attempts
  resources :questions
  resources :sessions
  resources :database
  resources :answers

  root :to => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
