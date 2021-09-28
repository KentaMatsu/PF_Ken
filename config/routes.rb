Rails.application.routes.draw do

  get 'search/search'
  devise_for :admins, controllers:{
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

 # namespace :users do
  scope module: :users do
    root to: 'homes#top'
    get 'home/about' => 'homes#about'

    get '/search' => 'search#search'


    get '/users/check' => "users#check", as: 'users_check'
    patch '/users/hide' => "users#hide", as: 'users_hide'

    resources :users, only: [:index, :show, :edit, :update, ] do
      resource :relationships, onry: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end



    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end

    resources :chat_rooms, only: [:create, :index, :show, :destroy] do
      resources :chats, only: [:create, :destroy]
    end
    get 'sort' => 'chat_rooms#sort'

    resources :contacts, only: [:new, :create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'

    resources :blogs, only: [:index, :show] do
      resources :blog_comments, only: [:index, :create, :destroy]
    end

  end

  namespace :admins do

    resources :blogs do
      resources :blog_comments, only: [:destroy]
    end

    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end

    resources :chat_rooms, only: [:index, :show, :destroy] do
      resources :chats, only: [:destroy]
    end

    resources :contacts, only: [:index, :show]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
