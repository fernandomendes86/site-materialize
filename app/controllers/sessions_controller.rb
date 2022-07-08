class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_username(session_params.fetch(:username))
    if user && user.authenticate(session_params.fetch(:password))
      flash[:notice] = "Login succesfully"
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:notice] = "Login error"
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "User logged out"
    redirect_to root_path
  end

  private 
    def session_params
      params.require(:session).permit(:username, :password)
    end
end