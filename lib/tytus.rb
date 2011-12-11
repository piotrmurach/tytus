# encoding: utf-8

require "tytus/version"
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
