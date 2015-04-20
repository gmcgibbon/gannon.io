Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin/', as: 'admin'

  devise_for :users, skip: [:sessions], controllers:
  {
    registrations: 'devise/registrations_override'
  }

  devise_scope :user do
    get    '/user/signin'  => 'devise/sessions#new',     as: :new_user_session
    post   '/user/signin'  => 'devise/sessions#create',  as: :user_session
    delete '/user/signout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'articles#index'

  get '/404', via: :all, to: 'application#not_found'
  get '/500', via: :all, to: 'application#internal_server_error'

  get '/blog/search', to: 'articles#search', as: 'search_articles'

  resources :articles,   param: :slug, path: '/blog/',     except: :index
  resources :pages,      param: :slug, path: '/',          except: :index
  resources :categories, param: :slug, path: '/category/', except: [:index, :new, :edit]
end
