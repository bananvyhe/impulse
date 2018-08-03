class WelcomeMailer < ApplicationMailer
	def send_welcome_mail 
		mail(to:"ludmilanagovetz@mail.ru",from:"noreply@impuls-psy.ru",subject:"Новое сообщение на сайте")
	end
end
