class UsersController < ApplicationController
  expose :token, -> {User.find_by_token(params[:user])}

  def create
    user = User.new(user_params)
    if user && user.save
      render json:  {message: 'user created, now confirm your email'}, status: 200
    else
      render json: {errors: user.errors.full_messages.to_sentence}, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation)
  end
end
