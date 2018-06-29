class SearchTerm < ApplicationRecord
  has_many :searches, dependent: :destroy

  validates :query, presence: true, uniqueness: true

  # Scope to filter past search history
  def self.filter_query(filter_by)
    if filter_by.present?
      case filter_by
      when 'alphabetical'
        order(query: :asc)
      when 'order-asc'
        order(updated_at: :asc)
      when 'order-desc'
        order(updated_at: :desc)
      when 'count'
        order(searches_count: :desc)
      else
        none # They probably put something that didn't match our filter params
      end
    else
      all
    end
  end
end
