# frozen_string_literal: true

module ApplicationHelper
  def button_name
    @user.new_record? ? 'Create' : 'Update'
  end
end
