# encoding: utf-8

require 'spec_helper'

describe Tytus do

  let(:controller) { Class.new(ActionController::Base) }
  let(:controller_instance) { controller.new }
  let(:view) { Class.new(ActionView::Base) }
  let(:view_instance) { view.new }

  context "methods for classes extending ControllerExtensions" do

    context '.title' do
      it "shoulbe be available to ActionController::Base" do
        controller.should respond_to :title
      end

      it "shoulbe be available to ActionController instance methods" do
        controller_instance.should respond_to :title
      end
    end

  end # ControllerExtensions

  context "methods for classes extending ViewExtensions" do

    context ".render_page_title" do
      it "should be available to ActionView::Base" do
        view_instance.should respond_to :render_page_title
      end
    end

    context '.check_translation' do
      it 'should find translation for controller-name' do
        view_instance.should_receive(:translate).and_return 'controller-name'
        view_instance.check_translation('controller-name')
      end

      it 'should fail to find translation and return humanized controller name' do
        view_instance.stub(:translate).and_return nil
        view_instance.check_translation('SomeController').should eq 'Somecontroller'
      end
    end
  end # ViewExtensions

end # Tytus
