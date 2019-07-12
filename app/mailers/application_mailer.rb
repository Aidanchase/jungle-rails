class ApplicationMailer < ActionMailer::Base
  default :from => "no-reply@jungle.com"
  layout 'mailer'

  def jungle_email order
    @order = order
    mail(:to => @order.email, :subject => "Jungle confirmation")
  end

end