class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false, precision: 7, scale: 2
      t.integer :quantity, null: false
      t.integer :size, null: false
      t.string :color, null: false
      t.string :model, null: false
      t.references :store, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
