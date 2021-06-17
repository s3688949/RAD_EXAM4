class HomeController < ApplicationController
  before_action :session?
  puts cookies[:list]
  
  def index
  end
end
