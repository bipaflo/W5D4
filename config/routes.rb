Rails.application.routes.draw do
  root 'gossips#index'

  get '/welcome/:id', to: 'welcome#first_name'

  get '/team', to: 'static#team'
  
  get '/contact', to: 'static#contact'

  resources :user, only: [:index, :show, :new, :create]

  resources :cities, only: [:index, :show]

  #routes for the modification of comments in gossips
  #routes imbriquées
  resources :gossips do
    resources :comments
    resources :likes
  end

  #routes for the session controller, for login/out purposes
  resources :sessions, only: [:new, :create, :destroy]
end
