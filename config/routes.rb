Rails.application.routes.draw do

  devise_for :users
  resources :topics do 
    resources :bookmarks, include: [:show, :new, :edit]
  end

  post :incoming, to: 'incoming#create'

  root 'welcome#index'
end
