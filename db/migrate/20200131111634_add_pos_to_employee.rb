class AddPosToEmployee < ActiveRecord::Migration[5.2]
  def change
  	add_column :employees, :position, :integer
  end
end
