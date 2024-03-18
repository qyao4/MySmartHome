class AddDefaultToDiscountInProducts < ActiveRecord::Migration[7.1]
  def up
    change_column_default :products, :discount, from: nil, to: 1
    change_column_null :products, :discount, false, 1
  end

  def down
    change_column_default :products, :discount, from: 1, to: nil
    change_column_null :products, :discount, true
  end
end
