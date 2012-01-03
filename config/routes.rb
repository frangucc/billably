Locomotive::Application.routes.draw do
  get "home/index"

  resources :categories, :only => [:index, :show]
  resources :clubs, :only => [:index, :show]
  resources :payments, :only => [:index]

  match '/auth/:provider' => 'authentications#error'
  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }

  match '/auth/failure'  => 'authentications#failure'
  resources :users
  resources :clubs, :only => [:index, :show]
  resources :attachments
  namespace :admin do
    resources :categories
    resources :images
    resources :merchants
    resources :packages
    resources :purchases
    resources :subscriptions
    resources :users
    root :to => "categories#index"
  end
  root :to => "home#index"
end

