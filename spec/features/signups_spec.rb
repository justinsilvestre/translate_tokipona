require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario 'with valid email and password' do
  	sign_up_with 'valid@example.com', 'Potatoface McGee', 'password'
    expect(page).to have_content('Log Out')
  end

  scenario 'with invalid email' do
  	sign_up_with 'invalid_email', 'Patataface McGah', 'password'
    expect(page).to have_content('Log In')
  end

  def sign_up_with(email, username, password, password_confirmation=nil)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    fill_in 'Confirm password', with: (password_confirmation || password)
    click_button 'Sign up'
  end
end
