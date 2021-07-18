# frozen_string_literal: true

Blog::Engine.routes.draw do
  root(to: "articles#index", as: :articles)

  resources(:articles, only: %i(show))
end
