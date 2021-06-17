class HomeController < ApplicationController
  def index
    puts cookies[:storage]
    cookies[:storage] = "HOPEFULLY THIS CARRIES"
    puts cookies[:storage]
  end
end
