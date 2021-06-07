# frozen_string_literal: true

Blog::Engine.routes.draw do
  root(to: redirect("/blog/articles"))

  resources(:articles, only: %i(index show))
end
