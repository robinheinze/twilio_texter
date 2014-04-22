TexterApp::Application.routes.draw do

  resources :messages, :only => [:new, :create] do
    collection do
      get :get_recipients
    end
  end

  resources :messages, :except => [:new, :create]



  resources :recipients
  resources :contacts
  root :to => 'messages#index'
end
