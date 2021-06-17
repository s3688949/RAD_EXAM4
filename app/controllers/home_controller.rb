class HomeController < ApplicationController
  before_action :session?
  skip_before_action :verify_authenticity_token
  
  def index
    cookies[:completed] = 0
    cookies[:correct] = 0
    cookies[:max] = 4
    list = Array.new(60) { |i| 1 * i + 1}
    list = list.shuffle()
    cookies[:list] = (list.class == Array) ? list.join(',') : ''
  end
  
  def max_set
    cookies[:max] = params[:maxQuestions].to_i
    @cookieArray = cookies[:list] ? cookies[:list].split(",") : [] 
    startPath = questions_path + "/" + @cookieArray.pop().to_s
    cookies[:list] = (@cookieArray.class == Array) ? @cookieArray.join(',') : ''
    redirect_to startPath
  end
end
