require 'easy_orderable/base'
module EasyOrderable
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec
      g.factory_bot dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer 'easy_orderable.insert_assort_into_active_record' do |_app|
      ActiveSupport.on_load :active_record do
        include EasyOrderable::Base
      end
    end
  end
end
