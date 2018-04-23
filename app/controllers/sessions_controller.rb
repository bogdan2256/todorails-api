class SessionsController < ApplicationController


  def create
    user = User.find_by(email: params[:session][:email].downcase)

  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
