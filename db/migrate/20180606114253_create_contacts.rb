class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :mail
      t.text :adress
      t.string :tel
      t.string :map

      t.timestamps
    end
  end
end
