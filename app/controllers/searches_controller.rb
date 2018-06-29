class SearchesController < ApplicationController
  def index
    @previous_searches = Search.all
    if params[:search].present?
      @results = NasaImages.new(query_params).search
    end
  end

  def create
    @previous_searches = Search.all
    Search.create(query: params[:search])
    @results = NasaImages.new(query_params).search
    render :index
  end

  private

  def query_params
    { search: params[:search] }
  end
end
