module ApplicationHelper
  def options_for_search_history_filter(selected = nil)
    options_for_select(
      [
        ['Ascending', 'order-asc'],
        ['Desending', 'order-desc'],
        ['Highest Searched', 'count']
      ],
      selected
    )
  end
end
