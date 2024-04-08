class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  # validates :order_id, presence: true
  # validates :product_id, presence: true
  # validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  # validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
