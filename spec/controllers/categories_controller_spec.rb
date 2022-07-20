# frozen_string_literal: true

require 'rails_helper'

describe CategoriesController do
  before { @category = Category.create(name: 'Movies') }

  context 'When create Categories' do
    it '.index' do
      get :index
      should respond_with(:success)
    end

    it '.new' do
      get :new
      should respond_with(:success)
    end

    it '.create' do
      expect do
        post :create, params: { category: { name: 'Musics' } }
      end.to change { Category.count }.by(1)

      should redirect_to(Category.last)
    end

    it '.show' do
      get :show, params: { id: @category.id }
      should respond_with(:success)
    end
  end
end
