class AddPositionToKatbibs < ActiveRecord::Migration[5.2]
  def change
  	add_column :katbibs, :position, :integer
  end
end
