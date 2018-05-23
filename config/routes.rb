Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :dashboard, only: :index
  resources :events, only: [:index, :show]
  resources :users, only: [:new, :show, :index, :create]
  resources :artists

  resources :venues, only: [:index, :show] do
    resources :events, only: [:index, :show]
  end

  namespace :admin do
    resources :venues do
      resources :events, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :artists
  end
end
