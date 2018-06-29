class SearchesController < ApplicationController
  def index
    @facade = SearchFacade.new(params)
  end

  def create
    Search.create(query: params[:search]) unless params[:search].blank?
    @facade = SearchFacade.new(params)
    render :index
  end
end
