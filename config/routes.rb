Rails.application.routes.draw do
  root to: 'static_pages#dash'
  
  get 'about', to: 'static_pages#about', as: 'about'
  get 'test', to: 'static_pages#test'
  
  namespace :api do
    resources :blogs, only: [:show] do
      resources :posts, only: [:index, :new]
    end
    
    resources :posts, only: [:create, :destroy, :index, :update]
    
    post 'blogs/:id/togglefollow', to: 'blogs#toggle_follow'
    get 'blogs/search/:query', to: 'blogs#search'
    
    post 'posts/:id/togglelike', to: 'posts#toggle_like'
    get 'posts/search/:query', to: 'posts#search'
  end
  
  resource :session, only: [:create, :destroy, :new]
  get 'session/guest', to: 'sessions#guest_login'
  
  get 'search/:query', to: 'searches#show', as: 'search'
  post 'search', to: 'searches#create', as: 'new_search'
  
  resources :users, except: [:index]
  
  resources :blogs, except: [:index] do
    get 'followers', to: 'blogs#followers'
    resources :posts, only: [:new]
  end
  
  resources :posts, except: [:new]
  
end
