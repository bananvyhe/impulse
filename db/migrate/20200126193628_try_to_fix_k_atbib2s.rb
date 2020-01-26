class TryToFixKAtbib2s < ActiveRecord::Migration[5.2]
  def change
 
  	add_column :katbib2s, :name, :string
  end
end
