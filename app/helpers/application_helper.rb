module ApplicationHelper
  def options_for_search_history_filter(selected = nil)
    options_for_select(
      [
        ['Alphabetical', 'alphabetical'],
        ['Recent search (ASC)', 'order-asc'],
        ['Recent search (DESC)', 'order-desc'],
        ['Highest Searched', 'count']
      ],
      selected
    )
  end
end
