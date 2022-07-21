# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'List categories', type: :feature do
  before { @category = Category.create(name: 'AA1') }
  before { @category2 = Category.create(name: 'AA2') }

  scenario 'should show the list of categories' do
    visit(categories_path)
    # find("a[href='/categories/#{@category.id}']")
    first("a[href='/categories/#{@category.id}']")
    first("a[href='/categories/#{@category2.id}']")
  end
end
