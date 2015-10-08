RSpec.configure do |config|

  config.include ControllerHelpers, type: :controller
  Warden.test_mode!

  config.after do
    Warden.test_reset!
  end
  
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers

end