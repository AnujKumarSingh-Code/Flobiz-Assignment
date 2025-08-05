class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :sku, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :quantity, null: false
      t.boolean :active, default: true, null: false
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end

    add_index :products, :sku, unique: true
  end
end
