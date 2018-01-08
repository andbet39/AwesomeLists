class CreateListEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :list_entries do |t|
      t.string :title
      t.string :url
      t.string :description
      t.string :category
      t.string :subcategory
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
