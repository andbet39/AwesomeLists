Rails.application.routes.draw do
  resources :list_entries
  resources :lists
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
