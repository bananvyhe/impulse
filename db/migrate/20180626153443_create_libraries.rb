class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :cover
      t.text :desc
      t.string :file

      t.timestamps
    end
  end
end
