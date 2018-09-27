class CreateKatbib2s < ActiveRecord::Migration[5.2]
  def change
    create_table :katbib2s do |t|
      t.integer :position

      t.timestamps
    end
  end
end
