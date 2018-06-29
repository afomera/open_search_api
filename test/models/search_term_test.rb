require 'test_helper'

class SearchTermTest < ActiveSupport::TestCase
  setup do
    @search_term = SearchTerm.new
  end

  test 'search term valid with query' do
    @search_term.query = 'ISS'
    assert @search_term.valid?
  end

  test 'search term invalid without a query' do
    @search_term.query = nil
    assert_not @search_term.valid?
    assert_includes @search_term.errors.full_messages, 'Query can\'t be blank'
  end

  test 'search term invalid if a query already exists' do
    # We have a fixture with a query of Mars
    @search_term.query = 'Mars'
    assert_not @search_term.valid?
    assert_includes @search_term.errors.full_messages, 'Query has already been taken'
  end
end
