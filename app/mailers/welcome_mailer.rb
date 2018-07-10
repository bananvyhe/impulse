class WelcomeMailer < ApplicationMailer
	def send_welcome_mail
		mail(to:"loadonden@yahoo.com",from:"admin@impuls-psy.ru",subject:"testingmail",message:"hi!")
	end
end
