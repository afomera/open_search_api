class Search < ApplicationRecord
  belongs_to :search_term, touch: true, counter_cache: true
end
