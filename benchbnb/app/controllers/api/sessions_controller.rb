class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      render :show
    else
      render json: "Invalid Username or Password Combo", status: 404
    end
  end

  def destroy
    # debugger
    if current_user
      # debugger
      logout!
      render json: {}
    else
      render json: "No one signed in", status: 404
    end
  end

end

