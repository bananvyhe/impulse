class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :image
      t.text :desc
      t.string :newspic

      t.timestamps
    end
  end
end
