# NasaImages
# Search the Nasa Images API
class NasaImages
  include HTTParty
  attr_reader(:params)

  def initialize(params = {})
    @params = params
  end

  def search
    HTTParty.get(endpoint, query: search_params).parsed_response
  end

  private

  def search_params
    {
      q: params[:search]
    }
  end

  def endpoint
    'https://images-api.nasa.gov/search'
  end
end
