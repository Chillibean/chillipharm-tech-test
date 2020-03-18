source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1', '>= 5.1.7'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.5'
gem "bootstrap-sass", ">= 3.4.1"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2.1'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.1.1'
gem 'jquery-ui-rails', '~> 5.0.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',           group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',                     group: :development
gem 'spring-commands-rspec',      group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.2'
gem 'validates_email_format_of', '~> 1.6.0'
gem 'responders', '~> 2.0'
gem 'paranoia', '~> 2.4', '>= 2.4.2'

group :development do
  gem 'binding_of_caller'
end

group :development, :test do
  gem "rspec-rails", '~> 3.5.0'
  gem 'rspec-json_expectations'
  gem 'faker', '~> 1.4.3'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'pry-rails'
end

group :test do
  gem 'capybara', '~> 2.7.1'
  gem 'email_spec'
  gem 'database_cleaner', '~> 1.8', '>= 1.8.3'
  gem 'launchy', '~> 2.4.2'
  gem 'selenium-webdriver', '~> 3.5'
  gem 'shoulda', '~> 3.6'
  gem 'simplecov', require: false
  gem 'rails-controller-testing'
end
