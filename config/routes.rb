Rails.application.routes.draw do

match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]

  get 'users/show'

  devise_for :users
    resources :users, only: [:show]

  resources :topics do 
    resources :bookmarks
  end

  resources :bookmarks do
      resources :likes, only: [:create, :destroy]
  end

  post :incoming, to: 'incoming#create'

  root 'welcome#index'
end
