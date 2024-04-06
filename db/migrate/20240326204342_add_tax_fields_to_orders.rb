class AddTaxFieldsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :gst, :decimal, precision: 10, scale: 2
    add_column :orders, :pst, :decimal, precision: 10, scale: 2
    add_column :orders, :total_with_taxes, :decimal, precision: 10, scale: 2
  end
end
