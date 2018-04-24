class UsersController < ApplicationController


 # expose :user, -> { User.find_by_token(params[:user]) }
  # def index
  #   user = User.all
  #   render json: user
  # end

  def create
    # p user
    # p user.valid?
    # p user.errors

    user = User.new(user_params)
    user.save
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation)
  end
end
