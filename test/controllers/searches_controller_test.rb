require('test_helper')

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test 'get index without search param' do
    get searches_url
    assert response.status.eql?(200)
  end

  test 'get index with search param' do
    get searches_url(search: 'Mars')
    assert response.status.eql?(200)
  end

  test 'get index with empty param' do
    get searches_url(search: '')
    assert response.status.eql?(200)
  end

  test 'get index with filter_by param' do
    get searches_url(filter_by: 'count')
    assert response.status.eql?(200)
  end
end
