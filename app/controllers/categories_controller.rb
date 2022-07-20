# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :category_params, only: %i[create]
  before_action :upload_params, only: %i[uploads]

  def index; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      uploads
      flash[:notice] = 'Category created successfuly'
      redirect_to @category
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def uploads
    uploaded_io = upload_params[:attachment]
    return if uploaded_io.nil?
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  private

  def upload_params
    params.require(:category).permit(:attachment)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
