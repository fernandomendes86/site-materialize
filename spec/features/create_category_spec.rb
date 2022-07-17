# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create Category', type: :feature do
  scenario 'User creates a new category' do
    visit(new_category_path)
    expect(page).to have_current_path(new_category_path)

    fill_in('name', with: 'Palmeiras')
    click_on('Salvar')

    visit(category_path(Category.last))
    expect(page).to have_content('Palmeiras')
  end
end
