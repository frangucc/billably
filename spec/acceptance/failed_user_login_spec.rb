require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'Fail login if user does not have access to account' do
  scenario "User cannot login with wrong email" do
    sign_up_for_refinery
    user = create :user, :password => 'password'
    login_url = "http://example.com/users/sign_in"
    visit login_url
    fill_in   'Email',    :with => 'email@email.com'
    fill_in   'Password', :with => 'password'
    click_on  'Sign In'

    page.current_url.should == login_url
  end

  scenario "Comfirmed user with wrong password to account does not redirect" do
    sign_up_for_refinery
    user = create :user, :password => 'password', :confirmed_at => Time.now
    other = create :user, :password => 'password', :confirmed_at => Time.now
    login_url = "http://example.com/users/sign_in"
    visit login_url
    fill_in   'Email',    :with => user.email
    fill_in   'Password', :with => 'wrong password'
    click_on  'Sign In'

    page.current_url.should == login_url
  end
end

