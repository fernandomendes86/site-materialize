# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]
  before_action :require_user, only: %i[edit update]
  before_action :require_same_user, only: %i[edit update]

  def index
    @users = User.order_by_name.page(params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @articles = @user.articles.page(params[:page])
  end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User (#{@user.username}) was succesfully updated." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: "User (#{@user.username}) was succesfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def require_same_user
    if set_user != current_user
      flash[:alert] = 'Access not allowed to your account!'
      redirect_to current_user
    end
  end
end
