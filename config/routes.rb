Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  post '/tags/:entity_type/:entity_id' => "tags#create"
  get '/tags/:entity_type/:entity_id' => "tags#show"
  delete '/tags/:entity_type/:entity_id' => "tags#destroy"
end
