Bloccitoff::Application.routes.draw do
  devise_for :users
  resources :users, only: [:update]

  get "welcome/about"
  
  root 'welcome#about'

end
