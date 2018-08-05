class AddUrlToSliders < ActiveRecord::Migration[5.2]
  def change
    add_column :sliders, :url, :string
  end
end
