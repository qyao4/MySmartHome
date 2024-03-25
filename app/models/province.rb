class Province < ApplicationRecord
  validates :name, presence: true
  validates :pst, :gst, numericality: { greater_than_or_equal_to: 0 }
end
