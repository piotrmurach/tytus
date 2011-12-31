# encoding: utf-8

require 'spec_helper'

describe "Rails integration", Tytus do
  include Integration

  let(:controller) { Class.new(ActionController::Base)}
  let(:site_title) { 'My Site Name' }
  let(:article) { 1 }

  context 'rendering tiles with only locales set' do

    it 'should display only site title' do
      visit root_path
      page.should have_css('title', :text => site_title)
    end

  end

  context 'rendering titles through controller stack' do

    it 'should be able to set title for controller' do
      visit articles_path
      page.should have_css('title', :text => 'All Articles :: ' + site_title)
    end

    it 'should be able to set title on controller level for specific actions' do
      visit new_home_path
      page.should have_css('title', :text => 'Home :: ' + site_title)
    end

    it 'should be able to override title for particular action' do
      visit article_path(article)
      page.should have_css('title', :text => 'Particular Article :: ' + site_title)
    end

  end

  context "rendering titles in view" do

    it "should be able to overide controller titles" do
      visit new_article_path
      page.should have_css('title', :text => 'Newer Title :: ' + site_title)
    end

    it "should render title back to the view" do
      visit new_article_path
      page.should have_css('h1', :text => 'Newer Title')
    end

  end

  context "setting title with an array" do
    it "should accept separated strings" do
      visit edit_article_path(article)
      page.should have_css('title', :text => 'Edit nice title :: ' + site_title)
    end
  end

end # Rails integration
