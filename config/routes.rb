Rails.application.routes.draw do
  resources :cards, only: [:all_cards]
  root to: 'site#index'
  post '/graphql', to: 'graphql#query'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
