# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root(to: "application#index")

  mount(Blog::Engine, at: :blog, path: "blog(.:format)")

  resources(:talks, only: %i(index))

  direct(:github) do
    "https://github.com/gmcgibbon"
  end

  direct(:github_repo) do |repo|
    "https://github.com/gmcgibbon/#{repo}"
  end

  direct(:shopify) do
    "https://www.shopify.ca/"
  end

  direct(:rrc) do
    "https://www.rrc.ca/"
  end

  direct(:rrc_bit) do
    "https://www.rrc.ca/informationsystems/bit/"
  end

  direct(:rails) do
    "https://rubyonrails.org/"
  end
end
