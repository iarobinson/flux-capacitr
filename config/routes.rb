Rails.application.routes.draw do
  root to: 'static_pages#welcome'
  
  resource :session, only: [:create, :destroy, :new]
  
  resources :users, except: [:index, :show]
  
  resources :blogs, except: [:index] do
    resources :posts, only: [:new]
  end
  
  resources :posts, except: [:new]
end
