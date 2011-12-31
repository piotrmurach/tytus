require 'capybara/rails'
require 'capybara/dsl'

RSpec.configure do |config|
  config.include Capybara::DSL, :example_group => { :file_path => /\bspec\// }
end
