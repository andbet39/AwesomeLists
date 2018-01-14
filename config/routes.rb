Rails.application.routes.draw do
  devise_for :users
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  post 'api/getlistinfo' => 'api_list#getinfo'


  get 'page/index'

  resources :list_entries
  resources :lists
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
