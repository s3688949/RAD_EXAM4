class ApplicationController < ActionController::Base
  helper_method :session?

  def session?
    if not cookies[:userId]
      cookies[:userId] = Time.now.to_f
      h1= History.create(userId: cookies[:userId])
    end
  end
end
