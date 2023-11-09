require 'rails_helper'

RSpec.feature 'Sign In page', type: :feature do
  describe 'signing in a user' do
    before do
      @me = User.create(name: 'me', email: 'me@code.io', password: 'f4k3p455w0rd')
      @me.confirm
      visit '/users/sign_in'
    end

    it 'should log Me in' do
      fill_in 'Email', with: 'me@code.io'
      fill_in 'Password', with: 'f4k3p455w0rd'
      click_button 'Log in'
      expect(page).to have_content 'Home'
    end
  end
end
