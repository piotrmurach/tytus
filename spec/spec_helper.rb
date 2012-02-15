require 'tytus'

# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../rails_app/config/environment.rb",  __FILE__)
require "rspec/rails"

require 'action_controller'
require 'action_view'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  config.include ActionController
  config.include ActionView
end
