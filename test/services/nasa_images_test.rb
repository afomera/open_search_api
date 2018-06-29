require('test_helper')

class NasaImagesTest < ActiveSupport::TestCase
  test 'search makes an API request for JSON' do
    params = { search: 'Mars' }
    response = NasaImages.new(params).search

    assert response.is_a?(Hash)
    assert response.keys.include?('collection')
    assert_format(response)
  end

  private

  def assert_format(response)
    assert response['collection']['version'].present?
    assert response['collection']['href'].present?
    assert response['collection']['items'].present?
    assert response['collection']['metadata'].present?
    assert response['collection']['links'].present?
  end
end
