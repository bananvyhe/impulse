class AddAvatarToProgramms < ActiveRecord::Migration[5.2]
  def change
    add_column :programms, :avatar, :string
  end
end
