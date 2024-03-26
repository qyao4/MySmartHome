class AddDefaultValueToStatusInOrders < ActiveRecord::Migration[7.1]
  def up
    change_column :orders, :status, :integer, default: 0
  end

  def down
    change_column :orders, :status, :integer, default: nil
  end
end
