Rails.application.routes.draw do

  root "graph#show"

  delete '/destroy_users' => "users#destroy_all_users", as: 'delete_all_users'
  delete '/destroy_deals' => 'deals#destroy_all_deals', as: 'delete_all_user_deals'
  

  get  "/graph/load_local_deals"
  post "/graph/save_user_location"
  get  "/graph/load_filter_deals" => 'graph#load_filter_deals'

  post '/users/:id/create_deal/' => 'deals#create', as: 'create_deal'
  get '/users/:id/create_deal/' => 'deals#new', as: 'new_deal'

  get '/users/:id/deals' => 'deals#show', as: 'show_deals'
  get '/users/:user_id/deals/:deal_id' => 'deals#edit', as: 'edit_deal'
  patch '/users/:user_id/deals/:deal_id' => 'deals#update', as: 'update_deal'
  delete '/users/:user_id/deals/:deal_id' => 'deals#destroy', as: 'delete_deal'
  delete '/users/:user_id/deals' => 'deals#destroy_all', as: 'delete_all_deals'

  patch '/deals/update_view_count' => 'deals#update_view_count'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/timeline' => 'timeline#show'
  get '/timeline/load_deals' => 'timeline#load_deals', as: 'load_deals'

  get "/users/:id" => "users#show", as: 'show_user'
  get "/users/:id/edit" => "users#edit", as: 'edit_user'
  patch "/users/:id/edit" => "users#update", as: 'update_user'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
