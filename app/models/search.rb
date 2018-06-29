class Search < ApplicationRecord
  validates :query, presence: true

  # Scope to filter past search history
  def self.filter_query(filter_by)
    if filter_by.present?
      # In many cases, we're doing each_with_object to provide us with a better
      # array to work with that includes the frequency of each query_param
      case filter_by
      when 'order-asc'
        order(created_at: :asc).pluck(:query).each_with_object({}) do |str, hash|
          hash[str] ||= 0; hash[str] += 1
        end
      when 'order-desc'
        order(created_at: :desc).pluck(:query).each_with_object({}) do |str, hash|
          hash[str] ||= 0; hash[str] += 1
        end
      when 'count'
        group(:query).count.sort_by {|_key, value| value}.reverse
      else
        none # They probably put something that didn't match our filter params
      end
    else
      all.group(:query).count.sort_by {|_key, value| value}
    end
  end
end
