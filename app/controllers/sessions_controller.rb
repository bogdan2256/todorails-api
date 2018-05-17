class SessionsController < ApplicationController
  def create
    user = User.find_by_email(session_params[:email].downcase)
    userq = {email: user.email, token: user.token, full_name: user.full_name, username: user.username}
    return render json: { message: 'Invalid email or password.' }, status: :unprocessable_entity unless user&.authenticate(session_params[:password])
    return render json: { message: 'Confirm your email.' }, status: :unprocessable_entity unless user.email_confirmed
    render json: userq, status: 200, each_serializer: SessionSerializer
    # render_api(userq, :ok, each_serializer: SessionSerializer)
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
