class CreateSearchTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :search_terms do |t|
      t.string :query
      t.integer :searches_count, default: 0

      t.timestamps
    end
  end
end
