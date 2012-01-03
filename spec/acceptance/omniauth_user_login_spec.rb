require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature 'Login as a user with Facebook' do
  background do
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(:facebook, {"uid" => "123456",
                                           "info" => {"email" => "test@facebook.com", "name" => "Test Facebook"},
                                           "credentials" => {"token" => "adf435ea245", "secret" => "h8965df4eab34c"}})
      sign_up_for_refinery
  end

  scenario "Confirmed user can login successfully and redirect if he has authenticated" do
    user = create :user, :confirmed_at => Time.now, :email => 'test@facebook.com'
    user.authentications.create(:user_id => user.id, :provider => 'facebook', :uid => '123456')

    visit     new_user_session_path
    click_on  'Facebook'

    page.current_url.should_not == new_user_session_path
  end

  scenario "Logged-in user stays logged in and authentication will be created" do
    user = create :user, :confirmed_at => Time.now, :email => 'test@facebook.com', :password => 'password'
    login_user_with_form user

    before_url = page.current_url
    click_on  'Facebook'
    page.has_content?('Sign Out') == true
    page.current_url.should == before_url
    user.authentications.where(:provider => 'facebook').should_not be_empty
  end

  scenario "New user will be redirected to signup page, and will be log in after enter existed" do
    visit root_path
    click_on  'Facebook'
    page.current_url.should == new_user_registration_url

    fill_in "First name", :with => "first name"
    fill_in "Last name", :with => "last name"
    fill_in "Zipcode", :with => "12345-9786"
    click_on "Sign up"
    page.has_content?('Sign Out') == true
  end

  scenario "New user will be redirected to signup page, and will be logged in and redirected to root after enter non-existed" do

    visit root_path
    click_on  'Facebook'
    page.current_url.should == new_user_registration_url

    fill_in "First name", :with => "first name"
    fill_in "Last name", :with => "last name"
    fill_in "Zipcode", :with => "12345-9786"
    click_on "Sign up"
    page.has_content?('Sign Out') == true
    page.current_url.should == "http://www.example.com/"
  end

  scenario "User will see failure page if authentication was denied" do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit root_path
    click_on  'Facebook'
    page.has_content?('Login via Oauth failed')
    page.current_url.should =~ /\/failure/
  end
end

feature 'Login as a user with Twitter' do
  background do
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(:twitter, {"uid" => "123456",
                                          "info" => { "name" => "Test Twitter"},
                                          "credentials" => {"token" => "adf435ea245", "secret" => "h8965df4eab34c"}})
    sign_up_for_refinery
  end

  scenario "Confirmed user can login successfully and redirect if he has authenticated" do
    user = create :user, :confirmed_at => Time.now, :email => 'test@twitter.com'
    user.authentications.create(:user_id => user.id, :provider => 'twitter', :uid => '123456')

    visit     root_path
    click_on  'Twitter'

    page.current_url.should_not == new_user_session_path
  end

  scenario "Logged-in user stays logged in and authentication will be created" do
    user = create :user, :confirmed_at => Time.now, :email => 'test@twitter.com', :password => 'password'
    login_user_with_form user
    page.should have_content("Twitter")
    before_url = page.current_url
    click_on  'Twitter'
    page.has_content?('Sign Out') == true
    page.current_url.should == before_url
    user.authentications.where(:provider => 'twitter').should_not be_empty
  end

  scenario "New user will be redirected to signup page, and will be log in after enter existed" do
    visit root_path
    click_on  'Twitter'
    page.current_url.should == new_user_registration_url

    fill_in "First name", :with => "first name"
    fill_in "Last name", :with => "last name"
    fill_in "Zipcode", :with => "12345-9786"
    click_on "Sign up"
    page.has_content?('Sign Out') == true
  end

  scenario "New user will be redirected to signup page, and will be logged in and redirected to root after enter non-existed" do

    visit root_path
    click_on  'Twitter'
    page.current_url.should == new_user_registration_url

    fill_in "First name", :with => "first name"
    fill_in "Last name", :with => "last name"
    fill_in "Zipcode", :with => "12345-9786"
    fill_in "Email",     :with => "test@twitter.com"
    click_on "Sign up"
    page.has_content?('Sign Out') == true
    page.current_url.should == "http://www.example.com/"
  end

  scenario "User will see failure page if authentication was denied" do
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
    visit root_path
    click_on  'Twitter'
    page.has_content?('Login via Oauth failed')
    page.current_url.should =~ /\/failure/
  end
end

feature 'Login as a user with LinkedIn' do
  background do
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(:linkedin, {"uid" => "123456",
                                           "info" => { "name" => "Test LinkedIn"},
                                           "credentials" => {"token" => "adf435ea245", "secret" => "h8965df4eab34c"}})
      sign_up_for_refinery
  end

  scenario "Confirmed user can login successfully and redirect if he has authenticated" do
    user = create :user, :confirmed_at => Time.now, :email => 'test@linkedin.com'
    user.authentications.create(:user_id => user.id, :provider => 'linkedin', :uid => '123456')

    visit     root_path
    click_on  'LinkedIn'

    page.current_url.should_not == new_user_session_path
  end

  scenario "Logged-in user stays logged in and authentication will be created" do
    user = create :user, :confirmed_at => Time.now, :email => 'test@linkedin.com', :password => 'password'
    login_user_with_form user

    before_url = page.current_url
    click_on  'LinkedIn'
    page.has_content?('Sign Out') == true
    page.current_url.should == before_url
    user.authentications.where(:provider => 'linkedin').should_not be_empty
  end

  scenario "New user will be redirected to signup page, and will be log in after enter existed" do
    visit root_path
    click_on  'LinkedIn'
    page.current_url.should == new_user_registration_url

    fill_in "First name", :with => "first name"
    fill_in "Last name", :with => "last name"
    fill_in "Zipcode", :with => "12345-9786"
    click_on "Sign up"
    page.has_content?('Sign Out') == true
  end

  scenario "New user will be redirected to signup page, and will be logged in and redirected to root after enter non-existed " do

    visit root_path
    click_on  'LinkedIn'
    page.current_url.should == new_user_registration_url

    fill_in "First name", :with => "first name"
    fill_in "Last name", :with => "last name"
    fill_in "Zipcode", :with => "12345-9786"
    fill_in "Email",     :with => "test@linkedin.com"
    click_on "Sign up"
    page.has_content?('Sign Out') == true
    page.current_url.should == "http://www.example.com/"
  end

  scenario "User will see failure page if authentication was denied" do
    OmniAuth.config.mock_auth[:linkedin] = :invalid_credentials
    visit root_path
    click_on  'LinkedIn'
    page.has_content?('Login via Oauth failed')
    page.current_url.should =~ /\/failure/
  end

end

