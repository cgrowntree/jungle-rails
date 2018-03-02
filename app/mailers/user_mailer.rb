class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_email(user, order)
    @user = user
    @order = order
    @url = 'http://localhost:3000/orders/'
    mail(to: @user.email, subject: "Your order number: #{@order.id} has shipped!")
  end
end 