class ContactInfo < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["address", "content", "created_at", "email", "id", "id_value", "phone", "postal_code", "updated_at"]
  end
end
