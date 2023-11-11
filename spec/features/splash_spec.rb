require 'rails_helper'

RSpec.feature 'Splash Page (unauthenticated root)', type: :feature do
  it 'Should render the unauthenticated root (Splash) page' do
    visit '/'
    expect(page).to have_content('MoneyMate')
    expect(page).to have_button('LOG IN')
    expect(page).to have_button('SIGN UP')
  end
end
