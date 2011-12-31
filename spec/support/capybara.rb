require 'capybara/rails'
require 'capybara/dsl'

RSpec.configure do |config|
  config.include Capybara, :example_group => { :file_path => /\bspec\// }
end
