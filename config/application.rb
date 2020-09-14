require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module PhotoApp
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.generators do |g|
      g.scaffold_controller false
      g.assets false
      g.helper false
      g.jbuilder false
    end
  end
end