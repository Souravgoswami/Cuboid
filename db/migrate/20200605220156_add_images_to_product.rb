class AddImagesToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :thumbnail, :text
    add_column :products, :main_image, :text
  end
end
