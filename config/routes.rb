Rails.application.routes.draw do
  root to: 'static_pages#dash'

  get 'about', to: 'static_pages#about', as: 'about'
  get 'easter-egg', to: 'static_pages#easter_egg', as: 'easter_egg'
  get 'lucky', to: 'blogs#lucky', as: 'lucky'

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show]
    get 'current_user', to: 'users#current'

    resources :blogs, only: [:show] do
      resources :posts, only: [:index, :new]
    end

    resources :posts, only: [:create, :destroy, :index, :show, :update]

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
    post 'members', to: 'blogs#add_members', as: 'members'
    delete 'members/:user_id', to: 'blogs#remove_member', as: 'remove_member'
    resources :posts, only: [:new]
  end

  resources :posts, except: [:new]
end
