class UsersController < ApplicationController

  before_action :set_params, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to articles_path, notice: "User (#{@user.username}) was succesfully crated." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end