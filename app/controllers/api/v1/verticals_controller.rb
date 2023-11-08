class Api::V1::VerticalsController < Api::V1::BaseController
  before_action :find_vertical, only: [ :show, :update, :destroy]

  def create
    @vertical = Vertical.new( vertical_params)
    if @vertical.save
      render json: VerticalSerializer.new(@vertical).serializable_hash[:data][:attributes]
    else
      render json: { error: "Error creating vertical"}
    end
  end

  def show
    if @vertical
      render json: VerticalSerializer.new(@vertical).serializable_hash[:data][:attributes]
    else
      render json: { error: "Vertical not found"}
    end
  end

  def update
    if @vertical
      if @vertical.update( vertical_params)
        render json: VerticalSerializer.new(@vertical).serializable_hash[:data][:attributes]
      else
        render json: { error: "Vertical not updated"}
      end
    else
      render json: { error: "Vertical not found"}
    end  
  end

  def destroy
    if @vertical
      if @vertical.delete
        render json: "Vertical deleted"
      else
        render json: { error: "Vertical not deleted"}
      end
    else
      render json: { error: "Vertical not found"}
    end  
  end

  def index 
    @verticals = Vertical.all
    render json: VerticalSerializer.new(@verticals).serializable_hash
  end

  private

  def find_vertical
    @vertical = Vertical.find_by( id: params[:id])
  end

  def vertical_params
    params.require(:vertical).permit(
      :name,
      categories_attributes: [ :id, :name, courses_attributes: [ :id, :name, :author, :state]]
    )
  end
end
