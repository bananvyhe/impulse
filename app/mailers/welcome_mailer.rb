class WelcomeMailer < ApplicationMailer
	def send_welcome_mail 
		mail(to:"loadonden@yahoo.com",from:"deploy@pixeltech.ru",subject:"Новое сообщение на сайте")
	end
end
