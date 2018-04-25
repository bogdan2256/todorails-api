class EmailConfirmationController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  expose :token, -> { params[:id] }
  expose :user, -> { User.find_by(token: token) }

  def show
     redirect_to "http://localhost:3001/#/users/sign_in" if user&.update_column(:email_confirmed, true)
  end
end
