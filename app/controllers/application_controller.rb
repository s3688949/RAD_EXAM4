class ApplicationController < ActionController::Base
  helper_method :session?

  def session?
    if not cookies[:userId]
      cookies[:userId] = Time.now.to_f
      h1= History.create(userId: cookies[:userId])
      cookies[:completed] = 0
      cookies[:correct] = 0
      cookies[:max] = 4
      list = Array.new(60) { |i| 1 * i + 1}
      list = list.shuffle()
      cookies[:list] = (list.class == Array) ? list.join(',') : ''
    end
  end
end
