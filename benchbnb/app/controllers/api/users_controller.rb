class Api::UsersController < ApplicationController

  # dont need dat ensure_logged_in amiright?

  def create # we think we did it?
    # debugger
    @user = User.new(user_params)
    if @user.save
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
