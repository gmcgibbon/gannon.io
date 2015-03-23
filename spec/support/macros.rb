RSpec.configure do |config|

  config.include ControllerMacros, type: :controller
  config.include FeatureMacros, type: :feature
end
