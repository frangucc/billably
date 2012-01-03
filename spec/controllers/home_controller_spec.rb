require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      user = Factory.create(:user)
      sign_in user
      get 'index'
      response.should be_success
    end
  end

end

