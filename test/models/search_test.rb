require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  setup do
    @search = Search.new
  end

  test 'search valid with search_term' do
    @search.search_term = SearchTerm.create(query: 'foobar')
    assert @search.valid?
  end

  test 'search invalid without a search_term' do
    @search.search_term = nil
    assert_not @search.valid?
    assert_includes @search.errors.full_messages, 'Search term must exist'
  end
end
