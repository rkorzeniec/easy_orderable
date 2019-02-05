class Booking < ApplicationRecord
  include EasyOrderable

  belongs_to :user
end
