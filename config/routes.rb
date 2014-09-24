Rails.application.routes.draw do
  root to: 'static_pages#welcome'
  
  namespace :api do
    resources :posts
    resources :tags, only: [:create, :destroy]
    resources :taggings, only: [:create, :destroy]
  end
  
  resource :session, only: [:create, :destroy, :new]
  
  resources :users, except: [:index, :show]
  
  resources :blogs, except: [:index] do
    resources :posts, only: [:new]
  end
  
  get ':blog_url', to: 'blogs#show'
  
  resources :posts, except: [:new]
end
