class HomeController < ApplicationController

  title 'Home', :only => :new

  def index; end

  def new; end
end
