class AddPositionToSlider < ActiveRecord::Migration[5.2]
  def change
    add_column :sliders, :position, :integer
  end
end
