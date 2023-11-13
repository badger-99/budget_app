require 'rails_helper'

RSpec.feature 'Sign Up page', type: :feature do
  describe 'signing up a user' do
    it 'should sign Me up' do
      visit '/users/sign_up'
      fill_in 'user_name', with: 'Me'
      fill_in 'user_email', with: 'me@code.io'
      fill_in 'user_password', with: 'f4k3p455w0rd'
      fill_in 'user_password_confirmation', with: 'f4k3p455w0rd'
      click_button 'Sign Up'
      expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
    end
  end
end
