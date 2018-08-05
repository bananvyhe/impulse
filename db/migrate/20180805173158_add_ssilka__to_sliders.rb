class AddSsilkaToSliders < ActiveRecord::Migration[5.2]
  def change
    add_column :sliders, :ssilka, :string
  end
end
