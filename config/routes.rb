Bloccitoff::Application.routes.draw do
  devise_for :users
  resources :users, only: [:update]
  resources :todos, only: [:new, :create, :show, :index] # :destroy

  get "welcome/about"
  
  root 'welcome#about'

end
