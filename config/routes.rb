TexterApp::Application.routes.draw do
  resources :messages
  resources :contacts
  root :to => 'messages#index'
end
