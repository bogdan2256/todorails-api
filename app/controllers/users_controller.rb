class UsersController < ApplicationController

  def index
    user = User.all
    render json: user
  end

  def create
    user = User.new(user_params)
    # p user
    # p user.valid?
    # p user.errors
     user.save
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation)
  end
end
