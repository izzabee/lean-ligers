class UserMailer < ApplicationMailer
	default from: 'example@ga.co'

	def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Liger Match!')
  end

end
