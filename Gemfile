source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# production
group :production do
    gem 'pg'
    gem 'rails_12factor'
end

# development
# Use sqlite3 as the database for Active Record
group :development do
    gem 'sqlite3', '1.3.8'
end

group :development, :test do
    gem 'rspec-rails'
    gem 'capybara'
    gem 'factory_girl_rails', '~> 4.3.0'
#   gem 'database_cleaner', '~> 1.2.0'
    gem 'capybara-screenshot'
    gem 'selenium-webdriver'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'atomic', '1.1.14'
gem 'sprockets_better_errors'

gem 'bootstrap-sass', '~> 3.1.1'
gem 'devise'
gem 'figaro'
gem 'pundit'
gem 'faker'
gem 'whenever', :require => false
gem 'newrelic_rpm'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
