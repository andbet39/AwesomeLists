class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :url
      t.string :repo_url

      t.timestamps
    end
  end
end