# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(session_params.fetch(:username))
    if @user&.authenticate(session_params.fetch(:password))
      flash[:notice] = 'Login succesfully'
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:alert] = 'Login error'
      render 'new'
    end
  end

  def destroy
    flash[:notice] = 'User logged out'
    reset_session
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
