module HelperMethods
  # Put helper methods you need to be available in all tests here.
  def login_user_with_form(user)
    visit     new_user_session_path
    fill_in   'Email',    :with => user.email
    fill_in   'Password', :with => 'password'
    click_on  'Sign in'
  end
end

RSpec.configuration.include HelperMethods
