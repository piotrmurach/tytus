# encoding: utf-8

require "rails"
require "tytus/version"
require "tytus/railtie"
require "tytus/compatibility"
require "tytus/controller_extensions"
require "tytus/view_extensions"

module Tytus

  if defined? Rails::Railtie
    require "tytus/railtie"
  else
    Tytus::Railtie.insert_view
    Tytus::Railtie.insert_controller
  end

end # Tytus
