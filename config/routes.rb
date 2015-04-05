Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin/', as: 'admin'

  devise_for :users, controllers:
  {
    registrations: 'devise/registrations_override'
  }

  root 'articles#index'

  get '/404', via: :all, to: 'application#not_found'
  get '/500', via: :all, to: 'application#internal_server_error'

  get '/blog/search/:search', to: 'articles#search', as: 'search_articles'

  resources :articles, param: :slug, path: '/blog/', except: :index
  resources :pages,    param: :slug, path: '/',      except: :index
end
