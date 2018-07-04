class AddCatToProgramms < ActiveRecord::Migration[5.2]
  def change
    add_column :programms, :cat, :integer
  end
end
