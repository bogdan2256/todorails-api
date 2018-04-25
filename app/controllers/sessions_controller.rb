class SessionsController < ApplicationController
   skip_before_action :authenticate_user!, only: :create



  def create
    # user = User.find_by(email: params[:session][:email].downcase)
    user = User.find_by_email(session_params[:email].downcase)

    userq = {email: user.email, token: user.token, full_name: user.full_name, username: user.username}
    return render json: { message: 'Invalid email or password.' }, status: :unprocessable_entity unless user&.authenticate(session_params[:password])
    return render json: { message: 'Confirm your email.' }, status: :unprocessable_entity unless user.email_confirmed
    render_api(userq, :ok)
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
