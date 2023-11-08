class Payment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :category_payments

  validates :name, presence: true
  validates :amount, presence: true
end
