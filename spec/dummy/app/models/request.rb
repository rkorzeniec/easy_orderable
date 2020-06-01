# frozen_string_literal: true

class Request < ApplicationRecord
  include EasyOrderable

  belongs_to :renter, class_name: 'User', foreign_key: :user_id
end
