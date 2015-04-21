Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin/', as: 'admin'

  devise_for :users, skip: [:sessions], controllers:
  {
    registrations: 'devise/registrations_override'
  }

  devise_scope :user do
    get    '/user/sign_in',  to: 'devise/sessions#new',     as: :new_user_session
    post   '/user/sign_in',  to: 'devise/sessions#create',  as: :user_session
    delete '/user/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'articles#index'
  get '/sitemap', to: 'application#sitemap'

  get '/404', via: :all, to: 'application#not_found'
  get '/500', via: :all, to: 'application#internal_server_error'

  resources :articles, param: :slug, path: '/blog/', except: :index do
    collection do
      get 'search', to: 'articles#search'
    end
  end
  resources :pages, param: :slug, path: '/', except: :index
  resources :categories, param: :slug, path: '/category/', except: [:index, :new, :edit] do
    member do
      post   'relate', to: 'categories#create_relation'
      delete 'relate', to: 'categories#destroy_relation'
    end
  end
end
