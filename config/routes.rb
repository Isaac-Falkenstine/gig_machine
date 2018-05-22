Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :dashboard, only: :index
  resources :events, only: [:index, :show]
  resources :users, only: [:new, :show, :index, :create]
  resources :venues do
    resources :events
  end

  namespace :admin do
    resources :venues
    resources :events
    resources :artists, only: [:edit, :destroy]
  end
end
