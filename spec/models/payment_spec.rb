require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations' do
    before do
      @me2 = User.create(name: 'me2', email: 'me2@code.io', password: 'f4k3p455w0rd')
      @me2.confirm
    end

    it 'creates a payment object' do
      payment = Payment.create(name: 'RSpec', amount: 501.99, author_id: @me2.id)
      expect(payment).to be_a(Payment)
    end

    it 'requiers a name' do
      payment = Payment.create(name: nil, amount: 501.99, author_id: @me2.id)
      expect(payment).not_to be_valid
    end

    it 'requires an amount' do
      payment = Payment.create(name: 'RSpec', amount: nil, author_id: @me2.id)
      expect(payment).not_to be_valid
    end

    it 'requires a user id' do
      payment = Payment.create(name: 'RSpec', amount: 501.99, author_id: nil)
      expect(payment).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      payment = Payment.reflect_on_association(:user)
      expect(payment.macro).to eq(:belongs_to)
    end

    it 'has many category payments' do
      payment = Payment.reflect_on_association(:category_payments)
      expect(payment.macro).to eq(:has_many)
    end
  end
end
