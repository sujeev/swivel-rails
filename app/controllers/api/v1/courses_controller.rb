class Api::V1::CoursesController < ApplicationController
  before_action :find_course, only: [ :show, :update, :destroy]

  def create
    @course = Course.new( course_params)
    if @course.save
      render json: @course
    else
      render json: { error: "Error creating course"}
    end
  end

  def show
    if @course
      render json: @course
    else
      render json: { error: "Course not found"}
    end
  end

  def update
    if @course
      if @course.update( course_params)
        render json: @course
      else
        render json: { error: "Course not updated"}
      end
    else
      render json: { error: "Course not found"}
    end  
  end

  def destroy
    if @course
      if @course.delete
        render json: "Course deleted"
      else
        render json: { error: "Course not deleted"}
      end
    else
      render json: { error: "Course not found"}
    end  
  end

  def index
    @courses = Course.all
    render json: @courses
  end

  private

  def find_course
    @course = Course.find_by( id: params[:id])
  end

  def course_params
    params.require(:course).permit(
      :name, 
      :author,
      :state,
      :category_id
    )
  end
end
