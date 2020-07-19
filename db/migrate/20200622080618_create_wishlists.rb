class CreateWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlists do |t|
      t.references :product, null: false, foreign_key: true, unique: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
