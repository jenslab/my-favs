class UserMailer < ApplicationMailer
  default from: 'palacios.jennifer@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://my-favs.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Favs!')
  end
end
end
