class AddMarkdownToList < ActiveRecord::Migration[5.1]
  def change
    add_column  :lists  , :markdown, :text,  :limit => 2.megabytes

  end
end
