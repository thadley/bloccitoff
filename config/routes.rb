Bloccitoff::Application.routes.draw do
  get "welcome/about"

  root to: 'welcome#about'
end
