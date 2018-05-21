class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    userq = {email: user.email, token: user.token, full_name: user.full_name, username: user.username}
    return render json: { message: 'Confirm your email.' }, status: :unprocessable_entity unless user.email_confirmed
    return render json: { message: 'Invalid email or password.' }, status: :unprocessable_entity unless user&.authenticate(params[:session][:password])
    render json: userq, status: 200, each_serializer: SessionSerializer
  end
end
