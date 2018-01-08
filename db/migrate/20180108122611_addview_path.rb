class AddviewPath < ActiveRecord::Migration[5.1]
  def change
    add_column  :lists , :readme_view_path , :string
  end
end
