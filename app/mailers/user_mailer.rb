class UserMailer < ApplicationMailer
  default :from => "no-reply@jungle.com"
  layout 'mailer'

  def confirmation_mailer order, user
    @order = order
    @user = user
    mail(:to => user.email, :subject => "Jungle confirmation for order #{order.id}")
  end
end
