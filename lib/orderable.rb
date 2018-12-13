require "orderable/railtie"
require "orderable/base"

module Orderable
  ActiveRecord::Base.extend Orderable::Base
end
