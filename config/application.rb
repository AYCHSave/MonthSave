require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Troquinho
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    
    config.generators do |g|
      g.fixture false
      g.view_specs false
      g.helper_specs false
      g.routing_specs false
    end
  end
end
