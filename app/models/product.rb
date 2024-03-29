class Product < ApplicationRecord
  belongs_to :category

  has_many_attached :images

  validates :name, presence: true
  validates :description, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  before_validation :set_default_discount, on: [:create, :update]

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "discount", "id", "id_value", "name", "price", "quantity", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end

  private

  def set_default_discount
    self.discount ||= 1
  end
end
