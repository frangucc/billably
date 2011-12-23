require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_many(:packages).through(:purchases) }
    it { should have_many :purchases }
  end

  describe "Class Methods" do
    it "find_for_authentication should find authentication" do
      conditions = {}
      expected = mock("USER")
      User.should_receive(:find).with(:first, :conditions => conditions).and_return(expected)
      User.find_for_authentication(conditions).should == expected
    end
    
    it "apply_omniauth should build & set authentication for user" do
      omniauth = {'provider' => 'provider', 'credentials' => {'secret' => 'secret', 'token' => 'token'}}
      omniauth_params = {:provider => omniauth['provider'], :uid => omniauth['uid'], :token => omniauth['credentials']['token'], :secret => omniauth['credentials']['secret']}
      user = User.new
      authentication = mock("Authentication")
      user.should_receive(:authentications).and_return(authentication)
      expected = mock("Authentication Association")
      authentication.should_receive(:build).with(omniauth_params).and_return(expected)
      time = mock('Time')
      Time.stub!(:now).and_return(time)
      user.should_receive(:confirmed_at=).with(time)
      user.apply_omniauth(omniauth).should_not be_nil
    end
    
    describe "password_required?" do
      it "should return true as login normal" do 
        user = create :user
        user.stub!(:super).and_return(true)
        user.authentications.stub!(:authentications).and_return([])
        user.password_required?.should be_true
      end

      it "should return true as password not blank" do 
        user = create :user
        user.stub!(:super).and_return(true)
        user.authentications.stub!(:password).and_return(mock('not empty'))
        user.password_required?.should be_true
      end

      it "should return false if login via provider" do 
        user = create :user
        user.stub!(:authentications).and_return([mock('not empty')])
        user.stub!(:password).and_return(nil)
        user.password_required?.should be_false
      end
    end
  end

  describe 'Database Columns' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:zipcode).of_type(:string) }
  end

  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :zipcode }
  end
end
