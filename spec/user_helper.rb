  def sign_up_with(email, username, password, password_confirmation=nil)
  	visit new_user_registration_path
  	fill_in 'Email', with: email
  	fill_in 'Username', with: username
    fill_in 'Password', with: password
    fill_in 'Confirm password', with: (password_confirmation || password)
    click_button 'Sign up'
  end