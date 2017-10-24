Rails.application.routes.draw do
  resources :teamsports
  resources :fields
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'application#index'
  resources :teams do
    resources :games
  end
  get '/teams/:id/games/:id', to: 'games#show', as: 'game'
  get '/teams/:id/games/new', to: 'games#new', as: 'newgame'
  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
  get '/teams/:id/games', to: 'games#index', as: 'games'
  get '/teams/:id/users', to: 'users#show', as: 'teamusers'
  get '/teams/:id/sports/new', to: 'sports#new', as: 'newsport'
  resources :sports
  resources :teams 
  resources :games
  # resources :users
  get '/auth/:provider/callback', to: 'sessions#create'
  
  #  devise_scope :user do
  #     delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #  end
  # end
end
