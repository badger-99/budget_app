require 'rails_helper'

RSpec.feature 'Splash Page', type: :feature do
  it 'Should render the unauthorized root (Splash) page' do
    visit '/'
    expect(page).to have_content('MoneyMate')
    expect(page).to have_button('Log In')
    expect(page).to have_button('Sign Up')
  end
end
