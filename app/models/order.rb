class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province

  has_many :order_items
  accepts_nested_attributes_for :order_items

  enum status: { unpaid: 0, paid: 1, shipping: 2, completed: 3, canceled: 4 }
end
