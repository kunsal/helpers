class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    p @categories.inspect
    render json: @categories, status: :ok
  end
end