RSpec.configure do |config|

  config.include ControllerMacros, type: :controller
  config.include FeatureMacros,    type: :feature
  config.include ActionMacros,     type: :feature
  config.include AjaxMacros,       type: :feature
end
