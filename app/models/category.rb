class Category < ApplicationRecord
  belongs_to :user
  has_many :category_payments

  validates :name, presence: true
  validates :icon, presence: true
  validates :user_id, presence: true
end
