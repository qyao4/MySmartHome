class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :user

  enum status: {failed: 0, successful: 1, cancelled: 2}
end
