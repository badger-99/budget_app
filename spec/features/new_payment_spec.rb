require 'rails_helper'

RSpec.feature 'New Category form', type: :feature do
  describe 'Root page for a logged-in user with a created category' do
    before(:each) do
      @me = User.create(name: 'me', email: 'me@code.io', password: 'f4k3p455w0rd')
      @me.confirm
      @category = Category.create(name: 'Test', icon: 'fa-solid fa-gears', user_id: @me.id)
      @category2 = Category.create(name: 'Test2', icon: 'fa-solid fa-heart-pulse', user_id: @me.id)
      login_as(@me, scope: :user)
      visit "/categories/#{@category.id}/payment/new"
    end

    it 'show new payment page elements' do
      expect(page).to have_content('New Transaction')
      expect(page).to have_link(href: "/categories/#{@category.id}/payment")
    end

    it 'show new payment form elements' do
      expect(page).to have_field('payment_name')
      expect(page).to have_field('payment_amount')
      expect(page).to have_field('category_ids[]', count: 2)
      expect(page).to have_button('Record Transaction')
    end
  end
end
