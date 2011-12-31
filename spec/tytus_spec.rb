# encoding: utf-8

require 'spec_helper'

describe Tytus do
  include Integration

  let(:controller) { Class.new(ActionController::Base) }
  let(:controller_instance) { controller.new }
  let(:view) { Class.new(ActionView::Base) }
  let(:view_instance) { view.new }

  context "methods for classes extending ControllerExtensions" do

    it "should be mixed in into ActionController::Base" do
      controller.included_modules.include?(Tytus::ControllerExtensions).should be_true
    end

    context '.title' do
      it "shoulbe be available to ActionController::Base" do
        controller.should respond_to :title
      end

      it "shoulbe be available to ActionController instance methods" do
        controller_instance.should respond_to :title
      end

      it "should be able to set title" do
        controller.title 'My Title'
      end
    end

  end # ControllerExtensions

  context "methods for classes extending ViewExtensions" do

    it "should be mixed in into ActionView::Base" do
      view.included_modules.include?(Tytus::ViewExtensions).should be_true
    end

    context '.site_name' do
      it "should be avaialbe to view" do
        view_instance.should respond_to :site_name
      end

      it "should use translation if name not present" do
        view_instance.site_name.should eq 'My Site Name'
      end

      it "should use name parameter if given" do
        view_instance.site_name('my-site').should eq 'my-site'
      end
    end

    context '.render_page_title' do
      it 'should be available to view' do
        view_instance.should respond_to :render_page_title
      end
    end

    context '.check_translation' do
      it 'should find translation for controller-name' do
        view_instance.check_translation('projects').should eq 'All Projects'
      end

      it 'should fail to find translation and return humanized controller name' do
        view_instance.check_translation('SomeController').should eq 'Somecontroller'
      end
    end

    context '.title' do
      it 'should be available to view' do
        view_instance.should respond_to :title
      end
    end
  end # ViewExtensions

end # Tytus
