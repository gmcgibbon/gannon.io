source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'cancancan'
gem 'js-routes'
gem 'simple_form'
gem 'slim-rails'
gem 'rails_admin'

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

  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'capybara'
  gem 'shoulda-matchers', require: false
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'database_cleaner'
  gem 'fuubar'

end
