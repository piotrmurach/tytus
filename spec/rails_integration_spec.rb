# encoding: utf-8

require 'spec_helper'

describe "Rails integration", Tytus do

  include Integration

  let(:controller) { Class.new(ActionController::Base)}

  it 'should be able to set title for controller' do
    visit articles_path
  end
end
