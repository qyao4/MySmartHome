class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :user

  enum status: {failed: 0, successful: 1, cancelled: 2}

  validates :order_id, presence: true
  validates :user_id, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }


end
