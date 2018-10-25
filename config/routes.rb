Rails.application.routes.draw do
  get '/', to: 'businesses#index'

  get '/businesses/new', to: 'businesses#new'

  get '/businesses/:id', to: 'businesses#show'

  get '/businesses/:id/edit', to: 'businesses#edit'

  post '/businesses', to: 'businesses#create'

  put '/businesses/:id', to: 'businesses#update'

  delete '/businesses/:id', to: 'businesses#destroy'
end
