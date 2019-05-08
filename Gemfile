source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'
# Autoload dotenv in Rails. (https://github.com/bkeepers/dotenv)
gem 'dotenv-rails', '2.7.2', require: 'dotenv/rails-now'

# Frontend
# This gem adds the bulma.io assets to your asset pipeline so you can import them in your Rails project. (https://github.com/joshuajansen/bulma-rails)
gem 'bulma-rails', '0.7.4'
# Font-Awesome SASS (https://github.com/FortAwesome/font-awesome-sass)
gem 'font-awesome-sass', '5.8.1'

# Active Job
# Simple, efficient background processing for Ruby (http://sidekiq.org)
gem 'sidekiq', '5.2.5'
# Light weight job scheduling extension for Sidekiq (https://moove-it.github.io/sidekiq-scheduler/)
gem 'sidekiq-scheduler', '3.0.0'
# Namespaces Redis commands. (http://github.com/resque/redis-namespace)
gem 'redis-namespace', '1.6.0'
# Get the status of  the web pages. (https://github.com/newsdict/web_stat)
gem 'web_stat', '0.1.6'

##
# Social Api Gems
##
# A Ruby interface to the Twitter API. (http://sferik.github.com/twitter/)
gem 'twitter', '6.2.0'

##
# User Manage
##
# Flexible authentication solution for Rails with Warden (https://github.com/plataformatec/devise)
gem 'devise', '4.6.2'
# Simple authorization solution for Rails. (https://github.com/CanCanCommunity/cancancan)
gem 'cancancan', '2.3.0'
# Mongoid database adapter for CanCanCan. (https://github.com/CanCanCommunity/cancancan-mongoid)
gem 'cancancan-mongoid', '2.0.0.beta1'

##
# User
##
# Admin for Rails (https://github.com/sferik/rails_admin)
gem 'rails_admin', '1.4.2'
# Kaminari Mongoid adapter (https://github.com/kaminari/kaminari-mongoid)
gem 'kaminari-mongoid', '1.0.1'

##
# mongodb
##
# Elegant Persistence in Ruby for MongoDB. (http://mongoid.org)
gem 'mongoid', '7.0.2'
# A MongoDB GridFS implementation for Mongoid (https://github.com/mongoid/mongoid-grid_fs)
gem 'mongoid-grid_fs', '2.4.0'
# Search implementation for Mongoid ORM (http://www.papodenerd.net/mongoid-search-full-text-search-for-your-mongoid-models/)
gem 'mongoid_search', '0.3.6'

##
# default gems
##
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Full-stack web application framework. (http://rubyonrails.org)
gem 'rails', '5.2.2'
# Use Puma as the app server
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications (http://puma.io)
gem 'puma', '3.12.0'
# Use SCSS for stylesheets
# Sass adapter for the Rails asset pipeline. (https://github.com/rails/sass-rails)
gem 'sass-rails', '5.0.7'
# Use Uglifier as compressor for JavaScript assets
# Ruby wrapper for UglifyJS JavaScript compressor (http://github.com/lautis/uglifier)
gem 'uglifier', '4.1.20'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# Use webpack to manage app-like JavaScript modules in Rails (https://github.com/rails/webpacker)
gem 'webpacker', '4.0.1'
# Use CoffeeScript for .coffee assets and views
# CoffeeScript adapter for the Rails asset pipeline. (https://github.com/rails/coffee-rails)
gem 'coffee-rails', '4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# Turbolinks makes navigating your web application faster (https://github.com/turbolinks/turbolinks)
gem 'turbolinks', '5.2.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# Create JSON structures via a Builder-style DSL (https://github.com/rails/jbuilder)
gem 'jbuilder', '2.8.0'
# Reduces boot times through caching; required in config/boot.rb
# Boot large ruby/rails apps faster (https://github.com/Shopify/bootsnap)
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Ruby fast debugger - base + CLI (https://github.com/deivid-rodriguez/byebug)
  gem 'byebug', '11.0.0'
  # factory_bot_rails provides integration between factory_bot and rails 4.2 or newer (https://github.com/thoughtbot/factory_bot_rails)
  gem 'factory_bot_rails', '5.0.2'
  # Fast debugging with Pry. (https://github.com/deivid-rodriguez/pry-byebug)
  gem 'pry-byebug', '3.7.0'
end

group :development do
  # Add comments to your Gemfile with each dependency's description. (https://github.com/ivantsepp/annotate_gem)
  gem 'annotate_gem', :git => 'https://github.com/newsdict/annotate_gem.git', :branch => :bundler_bump
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # A debugging tool for your Ruby on Rails applications. (https://github.com/rails/web-console)
  gem 'web-console', '3.7.0'
  # Listen to file modifications (https://github.com/guard/listen)
  gem 'listen', '3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # Rails application preloader (https://github.com/rails/spring)
  gem 'spring', '2.0.2'
  # Makes spring watch files using the listen gem. (https://github.com/jonleighton/spring-watcher-listen)
  gem 'spring-watcher-listen', '2.0.1'
  # Lock Gemfile gem declarations to specific Gemfile.lock versions (https://github.com/jeremyf/bundle-locker)
  gem 'bundle-locker', :git => 'https://github.com/newsdict/bundle-locker', :branch => 'feature/ignore_require_and_path'
  # Documentation tool for consistent and usable documentation in Ruby. (http://yardoc.org)
end

group :document do
  # Documentation tool for consistent and usable documentation in Ruby. (http://yardoc.org)
  gem 'yard', '0.9.19'
  # A YARD plugin to handle modules using ActiveSupport::Concern (https://github.com/digitalcuisine/yard-activesupport-concern)
  gem 'yard-activesupport-concern', '0.0.1'
  # An implementation of the AsciiDoc text processor and publishing toolchain (https://asciidoctor.org)
  gem 'asciidoctor', '2.0.9'
  # An extension for asciidoctor that adds support for UML diagram generation using PlantUML (https://github.com/asciidoctor/asciidoctor-diagram)
  gem 'asciidoctor-diagram', '1.5.16'
  # Guard keeps an eye on your file modifications (http://guardgem.org)
  gem 'guard', '2.15.0'
  # Guard gem for YARD (https://github.com/panthomakos/guard-yard)
  gem 'guard-yard', '2.2.1'
  # Guard gem for running shell commands (http://github.com/hawx/guard-shell)
  gem 'guard-shell', '0.7.1'
  # A Ruby wrapper for Linux inotify, using FFI (https://github.com/guard/rb-inotify)
  gem 'rb-inotify', '0.10.0', :require => false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  # Capybara aims to simplify the process of integration testing Rack applications, such as Rails, Sinatra or Merb (https://github.com/teamcapybara/capybara)
  gem 'capybara', '3.14.0'
  # The next generation developer focused tool for automated testing of webapps (https://github.com/SeleniumHQ/selenium)
  gem 'selenium-webdriver', '3.141.0'
  # Easy installation and use of chromedriver. (https://github.com/flavorjones/chromedriver-helper)
  gem 'chromedriver-helper', '2.1.0'
  # Library for stubbing HTTP requests in Ruby. (http://github.com/bblimke/webmock)
  gem 'webmock', '3.5.1'
  # Easily generate fake data (https://github.com/stympy/faker)
  gem 'faker', '1.9.3'
  # Strategies for cleaning databases.  Can be used to ensure a clean state for testing. (http://github.com/DatabaseCleaner/database_cleaner)
  gem 'database_cleaner', '1.7.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# Timezone Data for TZInfo (http://tzinfo.github.io)
gem 'tzinfo-data', '1.2018.9'
