class Api::V1::CategoriesController < ApplicationController
  before_action :find_category, only: [ :show, :update, :destroy]

  def create
    @category = Category.new( category_params)
    if @category.save
      render json: @category
    else
      render json: { error: "Error creating category"}
    end
  end

  def show
    if @category
      render json: @category
    else
      render json: { error: "Category not found"}
    end
  end

  def update
    if @category
      if @category.update( category_params)
        render json: @category
      else
        render json: { error: "Category not updated"}
      end
    else
      render json: { error: "Category not found"}
    end  
  end

  def destroy
    if @category
      if @category.delete
        render json: "Category deleted"
      else
        render json: { error: "Category not deleted"}
      end
    else
      render json: { error: "Category not found"}
    end  
  end

  def index
    @categories = Category.all
    render json: @categories
  end

  private

  def find_category
    @category = Category.find_by( id: params[:id])
  end

  def category_params
    params.permit( :name, :vertical_id)
  end

end
