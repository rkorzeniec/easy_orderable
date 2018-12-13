require 'factory_bot'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
 config.include FactoryBot::Syntax::Methods
 config.mock_with :rspec
 config.order = "random"
end
