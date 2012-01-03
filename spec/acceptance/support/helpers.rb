module HelperMethods
  # Put helper methods you need to be available in all tests here.
  def sign_up_for_refinery
    visit new_refinery_user_session_path
    click_on 'Continue'
    fill_in "Username", :with => "refinerycms"
    fill_in "Email", :with => "test@gfu.com"
    fill_in "Password", :with => "123456"
    fill_in "Password confirmation", :with => "123456"
    click_button "Sign up"
  end

  def login_user_with_form(user)
    visit     new_user_session_path
    fill_in   'Email',    :with => user.email
    fill_in   'Password', :with => 'password'
    click_on  'Sign In'
  end
end

RSpec.configuration.include HelperMethods

