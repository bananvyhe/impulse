class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :contact
      t.text :message

      t.timestamps
    end
  end
end
