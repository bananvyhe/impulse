class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :spec
      t.string :desc

      t.timestamps
    end
  end
end
