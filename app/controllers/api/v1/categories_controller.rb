class Api::V1::CategoriesController < Api::V1::BaseController
  before_action :find_category, only: [ :show, :update, :destroy]

  def create
    @category = Category.new( category_params)
    if @category.save
      render json: CategorySerializer.new(@category).serializable_hash[:data][:attributes]
    else
      render json: { error: "Error creating category"}
    end
  end

  def show
    if @category
      render json: CategorySerializer.new(@category).serializable_hash[:data][:attributes]
    else
      render json: { error: "Category not found"}
    end
  end

  def update
    if @category
      if @category.update( category_params)
        render json: CategorySerializer.new(@category).serializable_hash[:data][:attributes]
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
    @categories = Category.active.all
    render json: CategorySerializer.new(@categories).serializable_hash
  end

  private

  def find_category
    @category = Category.find_by( id: params[:id])
  end

  def category_params
    params.require(:category).permit(
      :name,
      :vertical_id,
      courses_attributes: [ :id, :name, :author, :state]
    )
  end

end
