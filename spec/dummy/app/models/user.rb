class User < ApplicationRecord
  include EasyOrderable

  has_many :bookings
  has_many :requests
end
