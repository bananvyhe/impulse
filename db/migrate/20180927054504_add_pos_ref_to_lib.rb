class AddPosRefToLib < ActiveRecord::Migration[5.2]
  def change
  	add_reference :libraries, :katbib2, index: true
  	add_column :libraries, :position, :integer
  end
end
