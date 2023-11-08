class CategoryPayment < ApplicationRecord
  belongs_to :category
  belongs_to :payment

  validates :category_id, presence: true
  validates :payment_id, presence: true
end
