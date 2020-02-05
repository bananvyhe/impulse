class AddPosToEmployee < ActiveRecord::Migration[5.2]
  def change
  	remove_column :employees, :position
  	add_column :employees, :position, :integer
  end
end
