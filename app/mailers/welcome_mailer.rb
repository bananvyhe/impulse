class WelcomeMailer < ApplicationMailer
	def send_welcome_mail
		mail(to:"loadonden@yahoo.com",from:"admin@pixeltech.ru",subject:"testingmail",message:"hi!",name:"bfdsb")
	end
end
