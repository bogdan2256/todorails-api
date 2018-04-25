# frozen_string_literal: true
class UserMailer < ApplicationMailer
  def registration_confirmation(user)
    @user = user
    @email = user.email
    mail(to: @user.email, subject: 'Email confirmation')
  end
end
