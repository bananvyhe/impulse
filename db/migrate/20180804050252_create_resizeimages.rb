class CreateResizeimages < ActiveRecord::Migration[5.2]
  def change
    create_table :resizeimages do |t|
      t.string :file

      t.timestamps
    end
  end
end
