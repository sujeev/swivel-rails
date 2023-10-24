class Api::V1::SearchController < Api::V1::BaseController
  def search
    @results = Course.search( params[:search]) unless params[:search].blank?
    @results = Course.search( '*') if params[:search].blank?

    render json: @results
  end
end
