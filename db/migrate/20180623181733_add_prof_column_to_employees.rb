class AddProfColumnToEmployees < ActiveRecord::Migration[5.2]
  def change
  	add_column :employees, :prof, :string
  end
end
