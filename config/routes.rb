Rails.application.routes.draw do

  namespace :public do
    get 'sessions/new'
  end
  scope module: :public do
    root to: "homes#top"
    resources :users, only: [:new, :create, :index, :show, :edit, :update]
    resources :posts

    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
  end

end
