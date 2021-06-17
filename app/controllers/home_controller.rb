class HomeController < ApplicationController
  before_action :session?
  
  def index
    cookies[:completed] = 0
    cookies[:correct] = 0
    cookies[:max] = 4
    list = Array.new(60) { |i| 1 * i + 1}
    list = list.shuffle()
    cookies[:list] = (list.class == Array) ? list.join(',') : ''
  end
end
