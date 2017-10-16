Rails.application.routes.draw do
  resources :sports
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'application#index'
  get '/teams/:id/games/:id', to: 'games#show', as: 'game'
  get '/teams/:id/games', to: 'games#index', as: 'games'
  get '/teams/:id/users', to: 'users#show', as: 'users'
  resources :teams
  resources :games
  # resources :users
  
  get '/auth/:provider/callback', to: 'sessions#create'
  
  #  devise_scope :user do
  #     delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #  end
  # end
end
