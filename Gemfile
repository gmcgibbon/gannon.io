source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'cancancan'
gem 'simple_form'
gem 'slim-rails'
gem 'rails_admin'
gem 'will_paginate'
gem 'normalize-rails'
gem 'bourbon'
gem 'font-awesome-rails'
gem 'github-markdown'

# if on Windows
if RUBY_PLATFORM =~ /i386-mingw32/
  gem 'thin'
  gem 'tzinfo-data'
# else on UNIX-like
else
  gem 'unicorn-rails'
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'shoulda-matchers', require: false
  gem 'shoulda-callback-matchers', require: false
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'fuubar'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'poltergeist'
end

group :development do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'guard'
  gem 'guard-rspec'
  gem 'spring'
  gem 'spring-commands-rspec'
end
