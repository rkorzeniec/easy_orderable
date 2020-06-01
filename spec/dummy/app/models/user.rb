# frozen_string_literal: true

class User < ApplicationRecord
  include EasyOrderable

  has_many :bookings
  has_many :requests
end
