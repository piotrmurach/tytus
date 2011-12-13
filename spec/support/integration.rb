module Integration
  def self.included(base)
    base.class_eval do
      include Capybara::DSL
      include Rails.application.routes.url_helpers
    end
  end
end
