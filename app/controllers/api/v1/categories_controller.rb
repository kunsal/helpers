class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    # p @categories.inspect
    render json: @categories, status: :ok
  end

  def show
    @category = Category.find(params[:id])
    render json: @category, status: :ok
  end

  def helps
    @category = Category.find(params[:id])
    @helps = @category.helps
    render json: @helps, status: :ok
  end
end