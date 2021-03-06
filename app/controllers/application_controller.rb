class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  before_action :set_cache_headers
  # before_action :authenticate_user!,  :only => [:new, :create]  
 
  # def send_mail
  #   WelcomeMailer.send_welcome_mail.deliver_now!
  # end
 
    private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
