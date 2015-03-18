RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.after(:suite) do
    FactoryGirl.lint
  end

end
