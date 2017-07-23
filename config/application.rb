require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyChat
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  config.serve_static_assets = true
  config.assets.paths << Rails.root.join('ng-chat/node_modules')
  config.assets.paths << Rails.root.join('ng-chat/dist')
  end
end
