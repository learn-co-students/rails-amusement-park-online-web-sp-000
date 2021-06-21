require_relative 'boot'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsAmusementPark
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # User.where("boolean_column = 't'").update_all(boolean_column: 1)
    # User.where("boolean_column = 'f'").update_all(boolean_column: 0)
    # Attraction.where("boolean_column = 't'").update_all(boolean_column: 1)
    # Attraction.where("boolean_column = 'f'").update_all(boolean_column: 0)
    # Ride.where("boolean_column = 't'").update_all(boolean_column: 1)
    # Ride.where("boolean_column = 'f'").update_all(boolean_column: 0)


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
