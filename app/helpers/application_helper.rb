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
end
