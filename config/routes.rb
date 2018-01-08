Rails.application.routes.draw do
  get 'page/index'

  resources :list_entries
  resources :lists
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
