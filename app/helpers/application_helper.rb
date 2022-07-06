# frozen_string_literal: true

module ApplicationHelper
  def button_name
    @user.new_record? ? 'Create' : 'Update'
  end

  def avatar_image
    faker_image = Faker::Avatar.image(slug: @user.username, size: "100x100")
    image_tag(faker_image, alt: @user.username, class: "img-rounded")
  end
end
