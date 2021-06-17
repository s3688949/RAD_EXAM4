class HomeController < ApplicationController
  before_action :session?
  def index
  end
  
  def kill
    if cookies[:userId]
      cookies[:userId] = nil
      cookies[:compelted] = nil
      cookies[:correct] = nil
      cookies[:max] = nil
      cookies[:list] =nil
    end
  end
end
