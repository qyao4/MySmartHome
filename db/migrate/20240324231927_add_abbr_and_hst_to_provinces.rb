class AddAbbrAndHstToProvinces < ActiveRecord::Migration[7.1]
  def change
    add_column :provinces, :abbr, :string
    add_column :provinces, :hst, :decimal, precision: 5, scale: 2
  end
end
