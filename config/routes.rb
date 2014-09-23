Rails.application.routes.draw do
  root to: 'static_pages#welcome'
  
  resource :session, only: [:create, :destroy, :new]
  
  resources :users
end
