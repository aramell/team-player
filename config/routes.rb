Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'team#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  
  #  devise_scope :user do
  #     delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #  end
  # end
end
