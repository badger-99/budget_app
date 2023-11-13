require 'rails_helper'

RSpec.feature 'Transactions page', type: :feature do
  describe 'Page showing all transactions in a given category' do
    before(:each) do
      @me = User.create(name: 'me', email: 'me@code.io', password: 'f4k3p455w0rd')
      @me.confirm
      @category = Category.create(name: 'Test', icon: 'fa-solid fa-gears', user_id: @me.id)
      @category2 = Category.create(name: 'Test2', icon: 'fa-solid fa-heart-pulse', user_id: @me.id)
      @payment = Payment.create(name: 'Capybara', amount: 501.99, author_id: @me.id)
      @payment2 = Payment.create(name: 'RSpec', amount: 457.76, author_id: @me.id)
      @payment3 = Payment.create(name: 'MiniTest', amount: 303.49, author_id: @me.id)
      @join = CategoryPayment.create(category_id: @category.id, payment_id: @payment.id)
      @join2 = CategoryPayment.create(category_id: @category.id, payment_id: @payment2.id)
      @join3 = CategoryPayment.create(category_id: @category2.id, payment_id: @payment3.id)
      login_as(@me, scope: :user)
    end

    it 'shows transactions for @category' do
      total = 501.99 + 457.76
      visit "/categories/#{@category.id}/payment"
      expect(page).to have_content('Transactions')
      expect(page).to have_content(@category.name)
      expect(page).to have_content("Total: $#{total}")
      expect(page).to have_content(@payment.name)
      expect(page).to have_content(@payment.amount)
      expect(page).to have_content(@payment2.name)
      expect(page).to have_content(@payment2.amount)
      expect(page).to_not have_content(@payment3.name)
      expect(page).to_not have_content(@payment3.amount)
      expect(page).to have_link(href: '/home')
    end
  end
end
