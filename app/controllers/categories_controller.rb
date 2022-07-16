# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :category_params, only: %i[create]

  def index; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category created successfuly'
      redirect_to @category
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end