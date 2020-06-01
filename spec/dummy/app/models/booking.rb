# frozen_string_literal: true

class Booking < ApplicationRecord
  include EasyOrderable

  belongs_to :user
end
