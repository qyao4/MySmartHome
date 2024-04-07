class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province

  has_many :order_items
  accepts_nested_attributes_for :order_items

  enum status: { unpaid: 0, paid: 1, shipping: 2, completed: 3, canceled: 4 }

  def self.ransackable_attributes(auth_object = nil)
    ["address", "city", "created_at", "gst", "id", "id_value", "post_code", "province_id", "pst", "status", "total_with_taxes", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_items", "province", "user"]
  end

end
