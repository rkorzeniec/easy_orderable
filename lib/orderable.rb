require "orderable/engine"
require "orderable/base"

module Orderable
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.include Orderable::Base
  end
end
