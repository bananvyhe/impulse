class CreateKatbibs < ActiveRecord::Migration[5.2]
  def change
    create_table :katbibs do |t|
      t.string :name

      t.timestamps
    end
  end
end
