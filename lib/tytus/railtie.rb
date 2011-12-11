# encoding: utf-8

module Tytus
  if defined? Rails::Railtie
    class Railtie < Rails::Railtie
      initializer 'tytus.view_extensions' do
        ActiveSupport.on_load :action_view do
          Tytus::Railtie.insert_view
        end
      end
      initializer 'tytus.controller_extensions' do
        ActiveSupport.on_load :action_controller do
          Tytus::Railtie.insert_controller
        end
      end
    end
  end

  class Railtie
    class << self
      def insert_view
        ActionView::Base.send :include, Tytus::ViewExtensions
      end

      def insert_controller
        ActionController::Base.send :include, Tytus::ControllerExtensions
      end
    end
  end

end # Tytus
