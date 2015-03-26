Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin/', as: 'admin'

  devise_for :users, controllers:
  {
    registrations: 'devise/registrations_override'
  }

  root 'application#root'

  get '/404', via: :all, to: 'application#not_found'
  get '/500', via: :all, to: 'application#internal_server_error'

  resources :articles, param: :slug, path: '/blog/', except: :index
  resources :pages,    param: :slug, path: '/',      except: :index
end
