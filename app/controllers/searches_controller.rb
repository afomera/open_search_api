class SearchesController < ApplicationController
  def index
    @previous_searches = Search.select(:query).distinct
    @search_activity = Search.where(query: params[:search])
    if params[:search].present?
      @results = NasaImages.new(query_params).search
    end
  end

  def create
    @previous_searches = Search.select(:query).distinct
    @search_activity = Search.where(query: params[:search])
    Search.create(query: params[:search]) unless params[:search].blank?
    @results = NasaImages.new(query_params).search
    render :index
  end

  private

  def query_params
    { search: params[:search] }
  end
end
