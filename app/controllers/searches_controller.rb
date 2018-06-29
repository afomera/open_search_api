class SearchesController < ApplicationController
  before_action(:set_facade)

  def index
    # If the user visits the index with the search param, we want to treat it
    # as if they submitted the search form, and record it as a new search for
    # that.
    Search.create(search_term: search_term) unless params[:search].blank?
  end

  def create
    Search.create(search_term: search_term) unless params[:search].blank?
    render :index
  end

  private

  def search_term
    SearchTerm.find_or_create_by(query: params[:search])
  end

  def set_facade
    @facade = SearchFacade.new(params)
  end
end
