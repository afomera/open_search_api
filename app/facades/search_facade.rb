class SearchFacade
  attr_reader(:params)

  def initialize(params)
    @params = params
  end

  def previous_searches
    @previous_searches ||= Search.select(:query).distinct
  end

  def search_activity
    @search_activity ||= Search.where(query: params[:search])
  end

  def results
    @results ||= NasaImages.new(query_params).search
  end

  private

  def query_params
    { search: params[:search] }
  end
end
