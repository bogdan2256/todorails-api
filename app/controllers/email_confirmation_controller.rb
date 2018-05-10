class EmailConfirmationController < ApplicationController
  expose :token, -> {params[:format]}
  expose :user, -> {User.find_by(token: token)}

  def show
    binding.pry
    redirect_to "#{Figaro.env.frontend_url}/users/sign_in" if user&user.update_column(:email_confirmed, true)
  end
end
