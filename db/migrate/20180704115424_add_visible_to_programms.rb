class AddVisibleToProgramms < ActiveRecord::Migration[5.2]
  def change
    add_column :programms, :visible, :boolean
  end
end
