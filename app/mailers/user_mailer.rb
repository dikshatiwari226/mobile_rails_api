class UserMailer < ActionMailer::Base
 
  def forgot(user)
  	@user = user
  	mail(to: @user.email, subject: 'Test Email for Letter Opener')
  end

end
