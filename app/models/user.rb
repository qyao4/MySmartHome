class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :province
  has_many :orders

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["orders", "province"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["username","email","phone","address","city","postal_code", "province_id", "created_at", "gst", "id", "id_value", "pst", "status", "total_with_taxes", "updated_at", "user_id","reset_password_token"]
    # %w[id username email phone address city postal_code]
  end

end
