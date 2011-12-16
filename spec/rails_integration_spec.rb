# encoding: utf-8

require 'spec_helper'
require 'tytus/railtie'

Tytus::Railtie.insert_view
Tytus::Railtie.insert_controller

describe "Rails integration", Tytus do

  include Integration

  let(:controller) { Class.new(ActionController::Base)}

  it 'should be able to set title for controller' do
    pending
    # visit root_path
  end
end
