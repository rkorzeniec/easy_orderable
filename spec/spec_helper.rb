# frozen_string_literal: true

require 'factory_bot'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.mock_with :rspec
  config.order = 'random'
end
