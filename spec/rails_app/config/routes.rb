RailsApp::Application.routes.draw do
  root :to => 'home#index'
  match 'home/new', :to => 'home#new', :as => 'new_home'
  resources :articles
end
