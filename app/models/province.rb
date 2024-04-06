class Province < ApplicationRecord
  validates :name, presence: true
  validates :pst, :gst, numericality: { greater_than_or_equal_to: 0 }
  def self.ransackable_attributes(auth_object = nil)
    ["abbr", "created_at", "gst", "hst", "id", "id_value", "name", "pst", "updated_at"]
  end
end
