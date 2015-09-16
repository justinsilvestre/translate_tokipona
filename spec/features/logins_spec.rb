require 'rails_helper'

RSpec.feature "Login", type: :feature do
  fixtures :users
  before do
  	@jatin = users(:jatin)
  	@jatin.password = 'password'
  end

  scenario 'with valid credentials' do
  	log_in_with @jatin.email, @jatin.password
  	expect(page).to have_content('Signed in successfully')
  end

  scenario 'with invalid credentials' do
  	log_in_with @jatin.email, 'psasword'
  	expect(page).to have_content('Invalid email or password')
  end

  def log_in_with(email, password)
		visit new_user_session_path
  	fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
