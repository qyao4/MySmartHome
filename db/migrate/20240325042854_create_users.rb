class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.references :province, null: false, foreign_key: true
      t.string :postal_code

      t.timestamps
    end
  end
end
