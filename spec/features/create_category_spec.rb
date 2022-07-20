# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create Category', type: :feature do
  scenario 'User successfully creates a new category' do
    visit(new_category_path)
    expect(page).to have_current_path(new_category_path)

    fill_in('name', with: 'Palmeiras')
    click_on('Salvar')

    visit(category_path(Category.last))
    expect(page).to have_content('Palmeiras')
  end

  scenario 'User trying to create a category with invalid data' do
    visit(new_category_path)
    expect(page).to have_current_path(new_category_path)

    fill_in('name', with: '')
    click_on('Salvar')
    find('div.red-text.text-darken-4')
    # expect(page).to have_css('div.red-text.text-darken-4')
    expect(page).to have_content('Dados inválidos')
  end
end
