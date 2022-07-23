# frozen_string_literal: true

require 'rails_helper'

describe CategoriesController do
  before do
    @category = Category.create(name: 'Movies')
    @admin_user = User.create(username: 'rspec-admin', email: 'rspec-admin@test.com',
                              password: 'rspec-admin', admin: true)
  end

  context 'When create Categories' do
    it '.index' do
      get :index
      should respond_with(:success)
    end

    it '.new' do
      sign_in_as(@admin_user)
      get :new
      should respond_with(:success)
    end

    it '.create' do
      sign_in_as(@admin_user)
      expect do
        post :create, params: { category: { name: 'Musics' } }
      end.to change { Category.count }.by(1)

      should redirect_to(Category.last)
    end

    it '.create - Should not create category if not admin' do
      expect do
        post :create, params: { category: { name: 'Musics' } }
      end.to_not change(Category.count)
    end

    it '.show' do
      get :show, params: { id: @category.id }
      should respond_with(:success)
    end
  end
end
