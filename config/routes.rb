Rails.application.routes.draw do
  root 'lists#index'
  resources :lists do
    resources :bookmarks, only: [ :new, :create, :destroy ]
  end




  # get 'lists/index', to: 'lists#index'
  # get 'lists/show', to: 'lists#show'
  # get 'lists/new', to: 'lists#new'
  # post 'lists/create', to: 'lists#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
