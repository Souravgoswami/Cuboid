class CreatePreviews < ActiveRecord::Migration[6.0]
  def change
    create_table :previews do |t|
      t.string :image
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
