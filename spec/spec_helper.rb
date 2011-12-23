ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}


module RspecHelpers
  # before :each
  def setup_host
    # for Controller Rspec
    if request
      request.host = 'exampe.com'
      request.env["HTTP_REFERER"] = 'http://www.redirect_to_back.com'

    # for Request Rspec
    else
      host! 'example.com' rescue NameError
    end
  end

end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include RspecHelpers
  config.infer_base_class_for_anonymous_controllers = false
  config.mock_with :rspec
  config.use_transactional_fixtures = true
end
