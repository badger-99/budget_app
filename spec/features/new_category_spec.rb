require 'rails_helper'

RSpec.feature 'New Category form', type: :feature do
  describe 'Root page for a logged-in user with a created category' do
    before(:each) do
      @me = User.create(name: 'me', email: 'me@code.io', password: 'f4k3p455w0rd')
      @me.confirm
      login_as(@me, scope: :user)
      visit '/categories/new'
    end

    it 'show new category page elements' do
      expect(page).to have_content('New Category')
      expect(page).to have_link(href: '/home')
    end

    it 'show new category form elements' do
      expect(page).to have_field('category_name')
      expect(page).to have_selector('.radio-input', count: 8)
      expect(page).to have_button('Create Category')
    end
  end
end
