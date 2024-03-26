class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :city
      t.references :province, null: false, foreign_key: true
      t.string :post_code

      t.timestamps
    end
  end
end
