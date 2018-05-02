class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

 expose :user, -> { User.find_by_token(params[:user]) }
  # def index
  #   user = User.all
  #   render json: user
  # end

  def create
    user = User.new(user_params)
    user.save

  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :firstname, :lastname, :password, :password_confirmation)
  end
end
