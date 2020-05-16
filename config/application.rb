require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"
require 'sidekiq/web'
require 'sidekiq-scheduler/web'
require 'open3'
require 'rss'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Newsdict
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    # White list, this app use those.
    config.i18n.available_locales = [:ja, :en]
    # Set locale
    config.i18n.default_locale = ENV["default_locale"]
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # Recursively including all model subdirectories
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '*', '**')]
    # Active Job
    config.active_job.queue_adapter = :sidekiq
    # Web site's prefix used by Source
    config.web_site_prefix = {
      twitter_account: 'https://twitter.com'}
    # path of `mecab-dict-index` in worker
    config.path_of_mecab_dict_index = "/usr/lib/mecab/mecab-dict-index"
    # path of custom mecab dictinary
    config.path_of_mecab_dict_dir = "/mnt"
    config.to_prepare do
      Devise::SessionsController.layout "devise"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "devise" }
      Devise::ConfirmationsController.layout "devise"
      Devise::UnlocksController.layout "devise"            
      Devise::PasswordsController.layout "devise"        
    end
    # XML Sitemaps
    config.gem 'sitemap_generator'
    # For vuejs
    config.vuejs_suffix = "v-bind:"
    # Paper item limit
    config.paper_item_limit = 16
    # Paper column number
    config.paper_column_number = 4
    # Enforce trailing slash in Rails Routing
    config.action_controller.default_url_options = { :trailing_slash => true }
  end
end
