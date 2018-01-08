class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :url
      t.string :content
      t.string :description
      t.integer :stars
      t.boolean :parsed

      t.timestamps
    end
  end
end
