class ApplicationRecord < ActiveRecord::Base
  include Orderable::Base
  self.abstract_class = true
end
