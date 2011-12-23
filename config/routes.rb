Locomotive::Application.routes.draw do
  get "home/index"

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

  # root :to => "home#index"
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
