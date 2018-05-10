class UsersController < ApplicationController
 expose :user, -> {User.find_by_token(params[:user])}

  def create
    user = User.new(user_params)

    if user && user.valid? && user.save
      render json:  {message: 'user created, now confirm your email'}
    else
      render json: {errors: user.errors.full_messages.to_sentence}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation)
  end
end
