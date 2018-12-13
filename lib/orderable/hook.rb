module Orderable
  class Hook
    def self.init
      ActiveSupport.on_load(:active_record) do
        include Orderable::Base
      end
    end
  end
end
