class CreateSliders < ActiveRecord::Migration[5.2]
  def change
    create_table :sliders do |t|
      t.string :slide
      t.string :caption1
      t.string :caption2

      t.timestamps
    end
  end
end
