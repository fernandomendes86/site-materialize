# frozen_string_literal: true

module ApplicationHelper
  def button_name
    @user.new_record? ? 'Create' : 'Update'
  end

  def avatar_image(user)
    faker_image = Faker::Avatar.image(slug: user.username, size: '100x100')
    image_tag(faker_image, alt: user.username, class: 'img-rounded')
  end

  def user_page(article)
    if article.user.try(:username)
      link_to(article.user.username.to_s, article.user)
    else
      'Anonymous'
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def loggined_in?
    !!current_user
  end

end
