Locomotive::Application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'registrations',
    :sessions      => 'sessions' }

  match '/auth/:provider' => 'authentications#error'
  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth/failure'  => 'authentications#failure'

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

  resources :attachments
  resources :categories, :only => [:index, :show]
  resources :clubs, :only => [:index, :show]
  resources :payments, :only => [:index]
  resources :subscriptions, :only => [:index, :show, :mine]
  resources :users

  root :to => "home#index"
end
