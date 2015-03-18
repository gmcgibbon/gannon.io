Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin/', as: 'admin'

  devise_for :users, controllers:
  {
    registrations: 'devise/registrations_override'
  }

  root 'application#root'

  get '/404', via: :all, to: 'application#not_found'
  get '/422', via: :all, to: 'application#unprocessible_entity'
  get '/500', via: :all, to: 'application#internal_server_error'

  resources :articles, param: :slug, path: '/blog/'
  resources :pages,    param: :slug, path: '/', except: :index
end
