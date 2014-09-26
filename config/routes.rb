Rails.application.routes.draw do
  root to: 'static_pages#root'
  
  namespace :api do
    resources :blogs, only: [:show] do
      resources :posts, only: [:index]
    end
    
    resources :posts, only: [:create, :destroy, :index, :update]
    
    post 'blogs/:id/togglefollow', to: 'followings#toggle'
    # post 'blogs/:id/follow', to: 'followings#create'
    # post 'blogs/:id/unfollow', to: 'followings#destroy'
    # resource :feed, only: [:show]
  end
  
  resource :session, only: [:create, :destroy, :new]
  
  resources :users, except: [:index, :show]
  
  resources :blogs, except: [:index] do
    resources :posts, only: [:new]
  end
  
  resources :posts, except: [:new]
end
