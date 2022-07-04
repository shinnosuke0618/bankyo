Rails.application.routes.draw do
  get '/search', to: 'searches#search'

  #管理者側ルーティング
  namespace :admin do
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
  end


  #会員側ルーティング
  scope module: :public do
    root to: "homes#top"
    post '/guest', to: 'guest_sessions#create'

    resources :users, only: [:create, :index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end

    resources :posts do
      resource :favorites, only: [:create, :destroy]
    end

    resources :chats, only: [:show, :create]

    get 'signup' => 'users#new'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
  end

end