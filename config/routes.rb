TexterApp::Application.routes.draw do
  resources :messages
  resources :recipients, only: :new
  resources :contacts
  root :to => 'messages#index'
end
