Rails.application.routes.draw do

  get 'bookmarks/show'

  get 'bookmarks/new'

  get 'bookmarks/edit'

  devise_for :users
  resources :topics

  post :incoming, to: 'incoming#create'

  root 'welcome#index'
end
