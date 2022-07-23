# frozen_string_literal: true

module LonginHelpers
  def sign_in_as(user)
    user = User.find_by_username(user.username)
    request.session[:user_id] = user.id
  end
end
