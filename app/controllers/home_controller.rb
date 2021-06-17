class HomeController < ApplicationController
  def index
    cookies[:storage] = "HOPEFULLY THIS CARRIES"
    puts cookies[:storage]
  end
end
