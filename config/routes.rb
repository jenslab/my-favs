Rails.application.routes.draw do

  devise_for :users
  resources :topics

  post :incoming, to: 'incoming#create'

  root 'welcome#index'
end
