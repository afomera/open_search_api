class Search < ApplicationRecord
  validates :query, presence: true

  VALID_FILTERS = ['order-desc', 'order-asc', 'count'].freeze
  # Scope to filter past searches
  def self.filter(filter_by)
    if filter_by.present?
      case filter_by
      when 'order-asc'
        order(created_at: :asc)
      when 'order-desc'
        order(created_at: :desc)
      when 'count'
        none
       #  group('query')
       # .order('count_query asc').count('count_query')
      else
        none # They probably put something that didn't match our filter params
      end
    else
      all
    end
  end
end
