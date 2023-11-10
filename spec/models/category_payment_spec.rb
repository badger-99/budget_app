require 'rails_helper'

RSpec.describe CategoryPayment, type: :model do
  describe 'validations' do
    before do
      @me2 = User.create(name: 'me2', email: 'me2@code.io', password: 'f4k3p455w0rd')
      @me2.confirm
      @category = Category.create(name: 'Test', icon: 'fa-solid fa-gears', user_id: @me2.id)
      @payment = Payment.create(name: 'RSpec', amount: 501.99, author_id: @me2.id)
    end

    it 'creates a category_payment object' do
      category_payment = CategoryPayment.create(category_id: @category.id, payment_id: @payment.id)
      expect(category_payment).to be_a(CategoryPayment)
    end

    it 'requires a category_id' do
      category_payment = CategoryPayment.create(category_id: nil, payment_id: @payment.id)
      expect(category_payment).not_to be_valid
    end

    it 'requires a payment_id' do
      category_payment = CategoryPayment.create(category_id: @category.id, payment_id: nil)
      expect(category_payment).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a category' do
      category_payment = CategoryPayment.reflect_on_association(:category)
      expect(category_payment.macro).to eq(:belongs_to)
    end

    it 'belongs to a payment' do
      category_payment = CategoryPayment.reflect_on_association(:payment)
      expect(category_payment.macro).to eq(:belongs_to)
    end
  end
end
