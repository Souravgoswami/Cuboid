class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true, user_id: { unique: true }

      t.timestamps
    end
  end
end
