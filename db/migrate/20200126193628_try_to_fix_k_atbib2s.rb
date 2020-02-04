class TryToFixKAtbib2s < ActiveRecord::Migration[5.2]
  def change
 		remove_column :katbib2s, :name
  	add_column :katbib2s, :name, :string
  end
end
