# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :loggined_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def loggined_in?
    !!current_user
  end

  def require_user
    unless loggined_in?
      flash[:alert] = 'You must be logged in!'
      redirect_to root_path
    end
  end
end
