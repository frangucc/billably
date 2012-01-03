require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'Login as a confirmed user at root of site' do
  scenario "login successfully and redirect" do
    sign_up_for_refinery
    user = create :user, :password => 'password', :confirmed_at => Time.now
    visit     "/users/sign_in"
    fill_in   'Email',    :with => user.email
    fill_in   'Password', :with => 'password'
    click_on  'Sign In'

    page.current_url.should_not == new_user_session_path
  end
end

feature 'Login as a confirmed user' do
  scenario "login successfully and do not redirect" do
    sign_up_for_refinery
    user = create :user, :password => 'password', :confirmed_at => Time.now
    visit "http://example.com/users/sign_in"
    fill_in   'Email',    :with => user.email
    fill_in   'Password', :with => 'password'
    click_on  'Sign In'

    page.current_url.should_not == new_user_session_path
  end
end

feature 'Login as a confirmed user at a common user' do
  scenario "login successfully and do not redirect" do
    sign_up_for_refinery
    user = create :user, :password => 'password', :confirmed_at => Time.now
    visit "http://example.com/users/sign_in"
    fill_in   'Email',    :with => user.email
    fill_in   'Password', :with => 'wrong password'
    click_on  'Sign In'

    page.current_url.should_not == new_user_session_path
  end
end

feature 'Login as a confirmed user at an authorized user' do
  scenario "login successfully and do not redirect" do
    sign_up_for_refinery
    user = create :user, :password => 'password', :confirmed_at => Time.now
    visit "http://example.com/users/sign_in"
    fill_in   'Email',    :with => user.email
    fill_in   'Password', :with => 'password'
    click_on  'Sign In'

    page.current_url.should_not == new_user_session_path
  end
end

