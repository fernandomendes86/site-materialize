# frozen_string_literal: true

require 'rails_helper'

describe Category do
  let(:category) { Category.new(name: 'sports3') }

  context 'When create Category' do
    it '.valid?' do
      expect(category.valid?).to be_truthy
    end
  end

  context 'Validations' do
    it 'presence of name' do
      should validate_presence_of(:name)
    end

    it 'unique name' do
      should validate_uniqueness_of(:name)
    end

    it 'length(minimum and maximum) name' do
      should validate_length_of(:name).is_at_least(3)
      should validate_length_of(:name).is_at_most(25)
    end
  end
end
