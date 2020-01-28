class UserMailer < ActionMailer::Base
 
  def forgot(user)
  	@user = user
  	mail(to: @user.email, subject: 'Forgot Password')
  end

end
