Rails.application.routes.draw do

  get 'chats/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  # chat機能
  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:show,:create]

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
  resources :book_comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end


  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
  # グループ参加と退会
    resource :group_users, only: [:create, :destroy]

  end

end