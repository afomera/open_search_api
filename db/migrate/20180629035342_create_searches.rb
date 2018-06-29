class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.references :search_term, index: true

      t.timestamps
    end
  end
end
