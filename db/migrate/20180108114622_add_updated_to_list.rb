class AddUpdatedToList < ActiveRecord::Migration[5.1]
  def change
    add_column  :lists  , :pushed_at, :datetime
    add_column  :lists , :readme_raw_path , :string
  end
end
