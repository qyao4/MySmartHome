class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.decimal :price
      t.decimal :discount
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
