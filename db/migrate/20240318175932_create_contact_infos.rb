class CreateContactInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_infos do |t|
      t.string :address
      t.string :postal_code
      t.string :phone
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
