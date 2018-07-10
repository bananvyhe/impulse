class Feedback < ApplicationRecord
	after_create :welcome_send
	def welcome_send
		WelcomeMailer.send_welcome_mail.deliver!
	end
 
end
