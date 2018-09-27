class AddColumnReviwes < ActiveRecord::Migration[5.2]
  def change
  	add_reference :reviews, :katbib, index: true
  	add_column :reviews, :position, :integer
  end
end
