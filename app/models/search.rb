class Search < ApplicationRecord
  validates :query, presence: true

  # Scope to filter past search history
  def self.filter(filter_by)
    if filter_by.present?
      case filter_by
      when 'order-asc'
        order(created_at: :asc).map(&:query)
      when 'order-desc'
        order(created_at: :desc).map(&:query)
      when 'count'
        # Returns a sorted array based off the highest count of searches for the
        # given query. Then we do some ruby magic, to order it by highest number
        # then pluck the 'query' from the array that includes the frequency count
        group(:query).count.sort_by(&:last).reverse.map(&:shift)
      else
        none # They probably put something that didn't match our filter params
      end
    else
      all.map(&:query)
    end
  end
end
