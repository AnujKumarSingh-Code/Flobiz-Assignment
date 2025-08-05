class CreateBusinesses < ActiveRecord::Migration[7.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :business_type
      t.string :status, default: "pending"

      t.timestamps
    end
    add_index :businesses, :email, unique: true
  end
end
