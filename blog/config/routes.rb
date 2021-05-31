# frozen_string_literal: true

Blog::Engine.routes.draw do
  resources(:articles, only: %i(index show))
end
