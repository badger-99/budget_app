require 'rails_helper'

RSpec.feature 'Home page  (authenticated root)', type: :feature do
  describe 'Root page for a logged-in user' do
    before do
      @me = User.create(name: 'me', email: 'me@code.io', password: 'f4k3p455w0rd')
      @me.confirm
      login_as(@me, scope: :user)
      visit '/'
    end

    it 'Should render the authenticated root (Home) page' do
      expect(page).to have_content 'Home'
      expect(page).to have_link('New Category', href: '/categories/new')
      expect(page).to have_link 'Sign Out'
    end
  end
end

RSpec.feature 'Home page  (authenticated root) with category information', type: :feature do
  describe 'Root page for a logged-in user with a created category' do
    before do
      @me = User.create(name: 'me', email: 'me@code.io', password: 'f4k3p455w0rd')
      @me.confirm
      @category = Category.create(name: 'Test', icon: 'fa-solid fa-gears', user_id: @me.id)
      @payment = Payment.create(name: 'Capybara', amount: 501.99, author_id: @me.id)
      @join = CategoryPayment.create(category_id: @category.id, payment_id: @payment.id)
      login_as(@me, scope: :user)
      visit '/'
    end

    it 'show category information' do
      expect(page).to have_selector('i.fa-solid.fa-gears')
      expect(page).to have_link('Test', href: "/categories/#{@category.id}/payment")
      expect(page).to have_content('$501.99')
    end
  end
end
