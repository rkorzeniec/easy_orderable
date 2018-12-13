module Orderable
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end
end
