# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root(to: "application#index")

  mount(Blog::Engine, at: :blog)

  resources(:talks, only: %i(index))
end
