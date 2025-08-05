class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.decimal :total_amount, precision: 10, scale: 2
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
