TexterApp::Application.routes.draw do
  resources :messages, :except => [:new, :create]

  resources :messages, :only => [:new, :create] do
    collection do.
      get :get_recipients
    end
  end

  resources :recipients, only: :new
  resources :contacts
  root :to => 'messages#index'
end
