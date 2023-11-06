class Payment < ApplicationRecord
  belongs_to :user
  has_many :category_payments

  validates :name, presence: true
  validates :amount, presence: true
  validate :at_least_one_category

  private

  def at_least_one_category
    return unless category_payments.empty?

    errors.add(:base, 'A payment must have at least one category')
  end
end
