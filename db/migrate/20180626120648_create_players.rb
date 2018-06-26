class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :team_id
      t.string :name
      t.string :graph
      t.string :group
      t.string :ind

      t.timestamps
    end
  end
end
