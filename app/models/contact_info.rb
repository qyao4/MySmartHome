class ContactInfo < ApplicationRecord

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, format: { with: /\A\+?\d{10,15}\z/, message: "must be a valid phone number" }
  validates :address, presence: true
  validates :postal_code, presence: true, format: { with: /\A[0-9A-Za-z\-]+\z/, message: "must be a valid postal code" }

  def self.ransackable_attributes(auth_object = nil)
    ["address", "content", "created_at", "email", "id", "id_value", "phone", "postal_code", "updated_at"]
  end
end
