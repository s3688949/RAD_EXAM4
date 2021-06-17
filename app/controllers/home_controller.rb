class HomeController < ApplicationController
  before_action :session?
  
  def index
    puts cookies[:list]
  end
end
