class SearchesController < ApplicationController
  def index
    # Slighty hacky to work-around issues when a user clicks a term on the side
    # so that we record the search
    Search.create(query: params[:search]) unless params[:search].blank?
    @facade = SearchFacade.new(params)
  end

  def create
    Search.create(query: params[:search]) unless params[:search].blank?
    @facade = SearchFacade.new(params)
    render :index
  end
end
