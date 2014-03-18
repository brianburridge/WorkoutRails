ruby   '1.9.3'

source 'http://rubygems.org'

gem 'capistrano', '~> 2'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'kaminari', '0.14.1'
gem 'pg',                 '~>0.16'
gem 'rails', '4.0.2'
gem 'rubber', '~> 2'
gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'unicorn'

group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'sprockets-rails', :require => 'sprockets/railtie'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.3.0'
end

group :development do
  gem "annotate", "~> 2.5.0"
end

group :development, :test do
  gem 'dotenv', '~>0.1.1'
  gem "guard-rspec", "~> 2.5.0"
  gem "launchy", "~> 2.2.0"
  gem "mailcatcher"
  gem "pry", "~> 0.9.12"
  gem "rb-fsevent", "~> 0.9.3"
  gem "rspec-nc", "~> 0.0.5", require: false
  gem "rspec-rails", "~> 2.13.0"
  gem "forgery", "~> 0.5.0"
  gem "factory_girl_rails", "~> 4.2.1"
end

group :test do
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.2.0"
  gem "mocha", "~> 0.13.2", :require    => false # see https://github.com/freerange/mocha about mocha require deprecation warning.
  gem "poltergeist", "~> 1.3.0", :require => false
  gem "turn", "~> 0.9.6", :require      => false
  gem "webmock", "~> 1.11.0"
  gem "shoulda", "2.11.3"
end


group :production do
  gem 'therubyracer', :require => false  # javascript for pre-compiling assets on the server
end