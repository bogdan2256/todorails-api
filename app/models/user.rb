class User < ApplicationRecord
  has_many :tasks

  has_secure_password
  has_secure_token :token
  after_create :send_email , unless: :email_confirmed

  def full_name
    "#{firstname} #{lastname}"
  end

  def send_email
    UserMailer.registration_confirmation(self).deliver_now
  end
end
